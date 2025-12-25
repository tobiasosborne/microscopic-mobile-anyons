# Appendix A: F-Symbols for the H₃ Fusion Category

## Overview

This appendix contains the complete solution for the F-symbols of the Haagerup fusion category H₃.

**Source**: https://github.com/R8monaW/H3Fsymbols

## Solution Parameters

The solution is **real** with two gauge parameters:
```
p₁, p₂ ∈ {-1, +1}
```

## Notation

The following constants appear throughout:

```
A = (1/2)(√13 - 3)

B = (1/3)(√13 - 2)

C = (1/6)(√13 + 1)

D_± = (1/12)(5 - √13 ± √(6(√13 + 1)))
```

## Organization

F-symbols are organized by matrix dimension:

1. **1-dimensional F-symbols**: Single complex numbers
2. **3×3 F-matrices**: For certain fusion channels
3. **4×4 F-matrices**: For channels with 4 fusion outcomes

## Properties

- All F-symbol values lie in the interval [-1, +1]
- Solution satisfies:
  - Pentagon equation
  - Unitarity conditions
  - Pivotal/spherical structure

## Visualization

F-symbols can be visualized as a pixel image:
- Black = +1
- White = -1
- Green shades = intermediate values (darker = closer to +1)

For p₁ = p₂ = +1, this produces the pattern shown in Figure A.1.

## Gauge Freedom

The two parameters p₁, p₂ represent remaining gauge freedom after fixing:
- Normalization conventions
- Trivalent vertex choices
- Phase conventions

Different choices of (p₁, p₂) give gauge-equivalent categories.

## Computation Method

F-symbols computed by solving:
- **41,391 equations** from pentagon identity
- **1,431 unknowns** initially
- Reduced via:
  1. Unitarity constraints
  2. Gauge fixing
  3. Trivalent category relations

## Connection to Thesis

These F-symbols are used for:
- Constructing H₃ anyon chains (Chapter 5)
- Building Levin-Wen Hamiltonian (Chapter 9)
- Verifying Morita equivalence (Chapter 4)

## Graph Database Metadata

```json
{
  "appendix": "A",
  "title": "F-symbols for H3",
  "category": "H3",
  "parameters": ["p1", "p2"],
  "parameter_values": ["-1", "+1"],
  "constants": {
    "A": "(√13-3)/2",
    "B": "(√13-2)/3",
    "C": "(√13+1)/6",
    "D_pm": "(5-√13 ± √(6(√13+1)))/12"
  },
  "properties": [
    "real_solution",
    "pentagon_satisfied",
    "unitary",
    "spherical"
  ],
  "computation": {
    "equations": 41391,
    "unknowns": 1431
  },
  "repository": "https://github.com/R8monaW/H3Fsymbols"
}
```
