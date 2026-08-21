// Exact high-throughput counterexample search for Schiffler Problem 6.3.
//
// For each coprime endpoint separately, enumerate rational Dyck paths, compute
// L^2=(B^2-4)/q_min^2 in reduced unsigned-128-bit arithmetic, and compare its
// fibers with cyclic/reversal classes of the literal step word.  A fiber with
// two different canonical classes is a Problem 6.3 counterexample.

#include <algorithm>
#include <cstdint>
#include <fstream>
#include <functional>
#include <iostream>
#include <numeric>
#include <stdexcept>
#include <string>
#include <unordered_map>
#include <vector>

using u128 = unsigned __int128;

struct Matrix {
  u128 a, b, c, d;
};

static Matrix multiply(const Matrix& x, const Matrix& y) {
  return {
      x.a * y.a + x.b * y.c,
      x.a * y.b + x.b * y.d,
      x.c * y.a + x.d * y.c,
      x.c * y.b + x.d * y.d,
  };
}

static Matrix digit_matrix(unsigned value) {
  return {value, 1, 1, 0};
}

static u128 gcd128(u128 x, u128 y) {
  while (y != 0) {
    u128 remainder = x % y;
    x = y;
    y = remainder;
  }
  return x;
}

static std::string text128(u128 value) {
  if (value == 0) return "0";
  std::string out;
  while (value != 0) {
    out.push_back(static_cast<char>('0' + value % 10));
    value /= 10;
  }
  std::reverse(out.begin(), out.end());
  return out;
}

struct FractionKey {
  u128 numerator;
  u128 denominator;

  bool operator==(const FractionKey& other) const {
    return numerator == other.numerator && denominator == other.denominator;
  }
};

static std::size_t mix64(std::uint64_t x) {
  x ^= x >> 30;
  x *= UINT64_C(0xbf58476d1ce4e5b9);
  x ^= x >> 27;
  x *= UINT64_C(0x94d049bb133111eb);
  x ^= x >> 31;
  return static_cast<std::size_t>(x);
}

struct FractionHash {
  std::size_t operator()(const FractionKey& key) const {
    const std::uint64_t n0 = static_cast<std::uint64_t>(key.numerator);
    const std::uint64_t n1 = static_cast<std::uint64_t>(key.numerator >> 64);
    const std::uint64_t d0 = static_cast<std::uint64_t>(key.denominator);
    const std::uint64_t d1 = static_cast<std::uint64_t>(key.denominator >> 64);
    std::size_t h = mix64(n0);
    h ^= mix64(n1 + UINT64_C(0x9e3779b97f4a7c15) + (h << 1));
    h ^= mix64(d0 + UINT64_C(0x517cc1b727220a95) + (h << 1));
    h ^= mix64(d1 + UINT64_C(0x6eed0e9da4d94a4f) + (h << 1));
    return h;
  }
};

struct FirstPath {
  std::uint64_t canonical;
  std::uint64_t literal;
};

struct ScoreData {
  FractionKey square;
  u128 trace;
  u128 q_min;
};

static ScoreData lagrange_square(std::uint64_t path, unsigned total) {
  std::vector<unsigned> word;
  word.reserve(2 * total);
  word.push_back(2);
  for (unsigned index = 0; index + 1 < total; ++index) {
    const bool left = (path >> index) & 1;
    const bool right = (path >> (index + 1)) & 1;
    if (left == right) {
      word.push_back(1);
      word.push_back(1);
    } else {
      word.push_back(2);
    }
  }

  const Matrix identity{1, 0, 0, 1};
  std::vector<Matrix> prefix(word.size() + 1, identity);
  std::vector<Matrix> suffix(word.size() + 1, identity);
  for (std::size_t index = 0; index < word.size(); ++index) {
    prefix[index + 1] = multiply(prefix[index], digit_matrix(word[index]));
  }
  for (std::size_t index = word.size(); index-- > 0;) {
    suffix[index] = multiply(digit_matrix(word[index]), suffix[index + 1]);
  }

  u128 q_min = static_cast<u128>(-1);
  for (std::size_t index = 0; index < word.size(); ++index) {
    const Matrix shifted = multiply(suffix[index], prefix[index]);
    q_min = std::min(q_min, shifted.c);
  }
  const u128 trace = prefix.back().a + prefix.back().d;
  const u128 discriminant = trace * trace - 4;
  const u128 denominator = q_min * q_min;
  const u128 divisor = gcd128(discriminant, denominator);
  return {{discriminant / divisor, denominator / divisor}, trace, q_min};
}

static std::uint64_t reverse_bits(std::uint64_t word, unsigned length) {
  std::uint64_t out = 0;
  for (unsigned index = 0; index < length; ++index) {
    out |= ((word >> index) & 1) << (length - 1 - index);
  }
  return out;
}

static std::uint64_t rotate_bits(std::uint64_t word, unsigned length,
                                 unsigned shift) {
  const std::uint64_t mask = length == 64 ? ~UINT64_C(0)
                                          : (UINT64_C(1) << length) - 1;
  if (shift == 0) return word & mask;
  return ((word >> shift) | (word << (length - shift))) & mask;
}

static std::uint64_t band_key(std::uint64_t path, unsigned total) {
  const std::uint64_t reversed = reverse_bits(path, total);
  std::uint64_t best = path;
  for (unsigned shift = 0; shift < total; ++shift) {
    best = std::min(best, rotate_bits(path, total, shift));
    best = std::min(best, rotate_bits(reversed, total, shift));
  }
  return best;
}

static std::string path_text(std::uint64_t path, unsigned total) {
  std::string out;
  out.reserve(total);
  for (unsigned index = 0; index < total; ++index) {
    out.push_back(((path >> index) & 1) ? 'R' : 'U');
  }
  return out;
}

struct EndpointResult {
  unsigned a;
  unsigned b;
  std::uint64_t paths = 0;
  std::uint64_t classes = 0;
};

struct Counterexample {
  bool found = false;
  unsigned a = 0;
  unsigned b = 0;
  std::uint64_t first = 0;
  std::uint64_t second = 0;
  ScoreData score{};
};

static EndpointResult audit_endpoint(unsigned a, unsigned b,
                                     Counterexample& counterexample) {
  const unsigned total = a + b;
  std::unordered_map<FractionKey, FirstPath, FractionHash> fibers;
  EndpointResult result{a, b};

  std::function<void(unsigned, unsigned, unsigned, std::uint64_t)> visit;
  visit = [&](unsigned position, unsigned right, unsigned up,
              std::uint64_t path) {
    if (counterexample.found) return;
    if (position == total) {
      ++result.paths;
      const ScoreData score = lagrange_square(path, total);
      const std::uint64_t canonical = band_key(path, total);
      const auto [iterator, inserted] =
          fibers.emplace(score.square, FirstPath{canonical, path});
      if (!inserted && iterator->second.canonical != canonical) {
        counterexample = {true, a, b, iterator->second.literal, path, score};
      }
      return;
    }
    if (right < a) {
      visit(position + 1, right + 1, up,
            path | (UINT64_C(1) << position));
    }
    if (up < b && static_cast<std::uint64_t>(a) * (up + 1) <=
                      static_cast<std::uint64_t>(b) * right) {
      visit(position + 1, right, up + 1, path);
    }
  };

  visit(0, 0, 0, 0);
  result.classes = fibers.size();
  return result;
}

int main(int argc, char** argv) {
  unsigned max_total = 31;
  std::string output_path;
  for (int index = 1; index < argc; ++index) {
    const std::string argument = argv[index];
    if (argument == "--max-total" && index + 1 < argc) {
      max_total = static_cast<unsigned>(std::stoul(argv[++index]));
    } else if (argument == "--output" && index + 1 < argc) {
      output_path = argv[++index];
    } else {
      throw std::invalid_argument("usage: search_problem_6_3 [--max-total N] [--output FILE]");
    }
  }
  if (max_total < 3 || max_total > 43) {
    throw std::invalid_argument("--max-total must lie in [3,43]");
  }

  std::vector<EndpointResult> rows;
  Counterexample counterexample;
  for (unsigned total = 3; total <= max_total && !counterexample.found; ++total) {
    for (unsigned a = total / 2 + 1; a < total; ++a) {
      const unsigned b = total - a;
      if (std::gcd(a, b) != 1) continue;
      EndpointResult row = audit_endpoint(a, b, counterexample);
      rows.push_back(row);
      std::cerr << "D(" << a << ',' << b << "): " << row.paths
                << " paths, " << row.classes << " L fibers\n";
      if (counterexample.found) break;
    }
  }

  std::uint64_t path_count = 0;
  for (const auto& row : rows) path_count += row.paths;
  std::string json = "{\n";
  json += "  \"claim_status\": \"finite exact counterexample search\",\n";
  json += "  \"max_total_length\": " + std::to_string(max_total) + ",\n";
  json += "  \"endpoint_count\": " + std::to_string(rows.size()) + ",\n";
  json += "  \"path_count\": " + std::to_string(path_count) + ",\n";
  json += "  \"counterexample_count\": " +
          std::to_string(counterexample.found ? 1 : 0);
  if (counterexample.found) {
    const unsigned total = counterexample.a + counterexample.b;
    json += ",\n  \"counterexample\": {\n";
    json += "    \"a\": " + std::to_string(counterexample.a) + ",\n";
    json += "    \"b\": " + std::to_string(counterexample.b) + ",\n";
    json += "    \"first\": \"" + path_text(counterexample.first, total) + "\",\n";
    json += "    \"second\": \"" + path_text(counterexample.second, total) + "\",\n";
    json += "    \"lagrange_square_numerator\": \"" +
            text128(counterexample.score.square.numerator) + "\",\n";
    json += "    \"lagrange_square_denominator\": \"" +
            text128(counterexample.score.square.denominator) + "\",\n";
    json += "    \"trace\": \"" + text128(counterexample.score.trace) + "\",\n";
    json += "    \"q_min\": \"" + text128(counterexample.score.q_min) + "\"\n";
    json += "  }\n";
  } else {
    json += "\n";
  }
  json += "}\n";

  if (output_path.empty()) {
    std::cout << json;
  } else {
    std::ofstream output(output_path);
    if (!output) throw std::runtime_error("cannot open output file");
    output << json;
  }
  return counterexample.found ? 2 : 0;
}
