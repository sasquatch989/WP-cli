#!/usr/bin/bash

APP=$(basename "$0")

usage() {
  printf '\nUsage: blog.sh ACTION[post|category] OPTION[--help|--category] 
\n\tACTION:\n\t\tpost: Post new blog entry\n\t\tcategory: Create new category
\n\tOPTION:\n\t\t--help Display this help content 
\t\t--category: Assign a category tag to a post
\nExample: \nblog.sh post add "title" "content" - Will add a new blog post
blog.sh category list - Will list all current categories'
  if $1; then
	  printf '\n%s' "$1"
  fi
  
  exit 1
}

parse_args() {
#Takes long-form arguments
  opts=":-:"
  if [[ -z $@ ]]; then
	  return_name
  fi
  while getopts "$opts" option; do
     	case "$option" in
		-)
		case "$OPTARG" in
                 	help)  usage;;
			category) printf 'category';;
                *) echo ":Unknown option: -${OPTARG}" >&2; usage;;
        		
		esac 
	esac
  done

}

return_name() {
#Returns the name of the running application
  printf "\nThis app is called %s\n" "$APP"
  exit 0
}



main() {
  parse_args "$@"
  

}


main "$@"
