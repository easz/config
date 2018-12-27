override_git_prompt_colors() {

  GIT_PROMPT_THEME_NAME="Custom"

  Time12a="\$(date +%H:%M)"
  AtHost="@"
  AtPath=":"
  PathShort="\w"
  Username="\u"
  Hostname="\H"

  GIT_PROMPT_START_USER="${Cyan}${Username}${Cyan}${AtHost}${Hostname}${AtPath}${Yellow}${PathShort}${ResetColor}"
  GIT_PROMPT_START_ROOT="${Red}${Username}${Cyan}${AtHost}${Hostname}${AtPath}${Yellow}${PathShort}${ResetColor}"
  GIT_PROMPT_END_USER=" \n${Yellow}${Time12a} $ ${ResetColor}"
  GIT_PROMPT_END_ROOT=" \n${Yellow}${Time12a} # ${ResetColor}"
}

reload_git_prompt_colors "Custom"
