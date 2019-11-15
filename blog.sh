#!/usr/bin/bash

APP='basename "$0"'


return_name() {
#Returns the name of the running application
  print "$APP"
  exit 0
}



main() {
  parse_args "$@"


}


main "$@"
