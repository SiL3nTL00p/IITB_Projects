
import json
import itertools
import math


def compute_assignment_probability(assignment, cliques):
    """
    Computes the unnormalized probability of a given assignment
    by multiplying all potentials from the cliques.
    """
    prob = 1
    for clique in cliques:
        size = clique["clique_size"]
        vars_ = clique["cliques"]
        pots = clique["potentials"]

        index = 0
        for i, v in enumerate(vars_):
            index += assignment[v] << (len(vars_) - i - 1)

        prob *= pots[index]
    return prob


def solve_test_case(test_case):
    num_vars = test_case["VariablesCount"]
    k = test_case["k value (in top k)"]
    cliques = test_case["Cliques and Potentials"]

    # Generate all possible binary assignments
    assignments = list(itertools.product([0, 1], repeat=num_vars))

    # Compute unnormalized probabilities
    probs = []
    for a in assignments:
        p = compute_assignment_probability(a, cliques)
        probs.append((a, p))

    Z = sum(p for _, p in probs)
    norm_probs = [(a, p / Z) for a, p in probs]

    # Marginals
    marginals = []
    for i in range(num_vars):
        p0 = sum(prob for a, prob in norm_probs if a[i] == 0)
        p1 = sum(prob for a, prob in norm_probs if a[i] == 1)
        marginals.append([p0, p1])

    # Top-k assignments
    top_k = sorted(norm_probs, key=lambda x: x[1], reverse=True)[:k]
    top_k_output = [{"assignment": list(a), "probability": p} for a, p in top_k]

    return {
        "Marginals": marginals,
        "Top_k_assignments": top_k_output,
        "Z_value": Z
    }


def main():
    with open("TestCases.json") as f:
        all_cases = json.load(f)

    output = []
    for case in all_cases:
        result = solve_test_case(case["Input"])
        output.append({
            "TestCaseNumber": case["TestCaseNumber"],
            "Output": result
        })

    with open("output.json", "w") as f:
        json.dump(output, f, indent=4)


if __name__ == "__main__":
    main()
