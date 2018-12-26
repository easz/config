override_git_prompt_colors() {

  GIT_PROMPT_THEME_NAME="Custom"

  PathShort="\w"
  Username="\u"
  Hostname="\H"

  GIT_PROMPT_START_USER="${Cyan}${Username}${White}@${Cyan}${Hostname}:${Yellow}${PathShort}${ResetColor}"
  GIT_PROMPT_START_ROOT="${Red}${Username}${White}@${Cyan}${Hostname}:${Yellow}${PathShort}${ResetColor}"

}

reload_git_prompt_colors "Custom"
