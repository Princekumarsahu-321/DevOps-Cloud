#!/usr/bin/env python3
"""Roll back a Kubernetes deployment to its previous revision."""

import argparse
import subprocess


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("deployment", choices=("backend", "frontend"))
    parser.add_argument("--namespace", default="mern-app")
    args = parser.parse_args()

    rollback = [
        "kubectl",
        "rollout",
        "undo",
        f"deployment/{args.deployment}",
        "--namespace",
        args.namespace,
    ]
    subprocess.run(rollback, check=True)
    subprocess.run(
        [
            "kubectl",
            "rollout",
            "status",
            f"deployment/{args.deployment}",
            "--namespace",
            args.namespace,
            "--timeout=180s",
        ],
        check=True,
    )


if __name__ == "__main__":
    main()