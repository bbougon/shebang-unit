function database__initialise() {
  _SBU_DB_TOKEN="${RANDOM}"
  _database__ensure_directory_exists
}

function database__release() {
  rm -rf "$(_database__get_dir)"
}

function database__put() {
  _database__ensure_directory_exists
  printf "%s" "$2" > "$(_database__get_dir)/$1"
}

function database__post() {
  _database__ensure_directory_exists
  printf "%s" "$2" >> "$(_database__get_dir)/$1"
}

function database__put_variable() {
  _database__ensure_directory_exists
  database__put "$1" "${!1}"
}

function database__get() {
  [[ -e "$(_database__get_dir)/$1" ]] && cat "$(_database__get_dir)/$1"
}

function _database__ensure_directory_exists() {
  mkdir -p "$(_database__get_dir)"
}

function _database__get_dir() {
  printf "${SBU_TEMP_DIR}/database/${_SBU_DB_TOKEN}"
}