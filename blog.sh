#!/usr/bin/bash

APP=$(basename "$0")

usage() {
  printf '\nUsage: blog.sh ACTION[post | category] OPTION[--help|--category] \
	\n\n\tACTION:\n\t\tpost: Post new blog entry\n\t\tcategory: Create \
	new category tag\n\nOPTION:\n\t\t--help Display this help content \
	\n\t\t--category: Assign a category tag to a post'
  if $1; then
	  printf '\n%s' "$1"
  fi
  
  exit 1
}

parse_args() {
#Takes long-form arguments
  opts=":-:"
  if [ $OPTIND -eq 1 ]; then
	  return_name
  fi
  while getopts "$opts" option; do
     	case "$option" in
		-)
		case "$OPTARG" in
                 	help)  usage;;
			category) printf 'category';;
                /?) echo ":Unknown option: -${OPTARG}" >&2; usage;;
        		
		esac 
	esac
  done

}

return_name() {
#Returns the name of the running application
  printf "\n$APP\n"
  exit 0
}



main() {
  parse_args "$@"
  

}


main "$@"
