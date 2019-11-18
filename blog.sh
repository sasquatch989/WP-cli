#!/usr/bin/bash

APP=$(basename "$0")
DB_FILE=./blog.json

usage() {
printf "\nUsage:\n\tblog.sh ACTION {TASK [OPTION|INPUT]}\
\nACTION:\
\n\tpost\t\t\t\tPost new blog entry\
\n\tcategory\t\t\tCreate new category\
\n\t--help\t\t\t\tDisplay this help content\
\nExample:\n\tblog.sh post add <title> <content> - Will add a new blog post\
\n\tblog.sh category list - Will list all current categories\
\nUse help for help in each context:\
\n\tblog.sh post help\n"
  if [[ ! -z $1 ]]; then
	  printf '\n%s\n' "$1"
  fi
  
  exit 1
}

start_parse() {
#Declaring positional args dynamically
  for i in $(seq 1 "$#"); do
        declare ARG$i=$(echo ${!i})
  done

#Using positional args

  	case "$ARG1" in
		--help|-h) usage;;
		post) post;;
		category) category;;
		*) usage "Unknown argument: ${ARG1}";;	
	esac
}

return_name() {
#Returns the name of the running application
  printf "\n%s\n" "$APP"
  exit 0
}


post() {
  case "$ARG2" in 
	add) post_add;;
	list) post_list;; 
	search) post_search;;
	*) post_help;;	
  esac
}

post_add() {
  if [[ ! -n $ARG3 ]] | [[ ! -n $ARG4 ]]; then
	  post_add_help
  fi

  BLOG_COUNT=$(jq '.[].blog.postIDs | length' blog.json)
  

}

post_add_help() {
printf "\nUsage:\n\t post add <title> <content>\n"
exit 1

}

post_list() {
printf "POST LIST"

}

post_search() {
printf "POST SEARCH"
}

post_help() {
printf "\nUsage post:\
\n\tadd\t\t\t\tAdd new post\
\n\tlist\t\t\t\tList all blog posts\
\n\tsearch\t\t\t\tSearch in posts for keyword\
\n\thelp\t\t\t\tShow help\n\n"
exit 1
}

category() {
pass

}

main() {
  if [[ ! -n $@ ]]; then return_name; fi
  start_parse "$@"
  

}


main "$@"
