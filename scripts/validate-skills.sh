#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "${SCRIPT_DIR}/.." && pwd)"
ROOT_SKILLS_DIR="${REPO_ROOT}/skills"
VALIDATOR="${SKILL_VALIDATOR:-$HOME/.codex/skills/.system/skill-creator/scripts/quick_validate.py}"

if [[ ! -f "${VALIDATOR}" ]]; then
  echo "validator not found: ${VALIDATOR}" >&2
  echo "Set SKILL_VALIDATOR to the absolute path of quick_validate.py." >&2
  exit 1
fi

validated=0
failed=0

run_basic_validation() {
  local skill_dir="$1"
  local skill_name
  skill_name="$(basename "${skill_dir}")"

  [[ -f "${skill_dir}/SKILL.md" ]] || {
    echo "missing SKILL.md: ${skill_name}" >&2
    return 1
  }

  rg -q '^name:\s' "${skill_dir}/SKILL.md" || {
    echo "missing frontmatter name: ${skill_name}" >&2
    return 1
  }

  rg -q '^description:\s' "${skill_dir}/SKILL.md" || {
    echo "missing frontmatter description: ${skill_name}" >&2
    return 1
  }

  [[ -f "${skill_dir}/agents/openai.yaml" ]] || {
    echo "missing agents/openai.yaml: ${skill_name}" >&2
    return 1
  }

  rg -q 'display_name:' "${skill_dir}/agents/openai.yaml" || {
    echo "missing display_name in openai.yaml: ${skill_name}" >&2
    return 1
  }

  rg -q 'short_description:' "${skill_dir}/agents/openai.yaml" || {
    echo "missing short_description in openai.yaml: ${skill_name}" >&2
    return 1
  }

  rg -q 'default_prompt:' "${skill_dir}/agents/openai.yaml" || {
    echo "missing default_prompt in openai.yaml: ${skill_name}" >&2
    return 1
  }
}

validate_collection() {
  local skills_dir="$1"
  local skill_dir

  for skill_dir in "${skills_dir}"/*; do
    [[ -d "${skill_dir}" ]] || continue
    if [[ "${has_full_validator}" -eq 1 ]]; then
      python3 "${VALIDATOR}" "${skill_dir}" || failed=1
    else
      run_basic_validation "${skill_dir}" || failed=1
    fi
    validated=$((validated + 1))
  done
}

has_full_validator=1
python3 -c 'import yaml' >/dev/null 2>&1 || has_full_validator=0

if [[ "${has_full_validator}" -eq 0 ]]; then
  echo "PyYAML not installed; falling back to basic structural validation." >&2
fi

if [[ -L "${ROOT_SKILLS_DIR}" ]]; then
  echo "root skills directory must be a real directory, not a symlink: ${ROOT_SKILLS_DIR}" >&2
  failed=1
fi

if [[ ! -d "${ROOT_SKILLS_DIR}" ]]; then
  echo "root skills directory not found: ${ROOT_SKILLS_DIR}" >&2
  failed=1
fi

if [[ -e "${REPO_ROOT}/plugins/skills-marketplace/skills" ]]; then
  echo "plugin-local skills directory must not exist: ${REPO_ROOT}/plugins/skills-marketplace/skills" >&2
  failed=1
fi

validate_collection "${ROOT_SKILLS_DIR}"

echo "validated ${validated} skill(s)"

if [[ "${failed}" -ne 0 ]]; then
  exit 1
fi
