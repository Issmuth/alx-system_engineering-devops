#!/usr/bin/python3
"""api gather."""
import requests
import sys


if __name__ == "__main__":
    employee = requests.get('https://jsonplaceholder.typicode.com/users/{}'
                            .format(sys.argv[1])).json()
    todos = requests.get('https://jsonplaceholder.typicode.com/todos?userId={}'
                         .format(sys.argv[1])).json()

    done = requests.get('https://jsonplaceholder.typicode.com/'
                        'todos?userId={}&&completed=true'
                        .format(sys.argv[1])).json()

    print('Employee {} is done with tasks({}/{}):'
          .format(employee.get('name'), len(done), len(todos)))

    for task in done:
        print('\t {}'.format(task.get('title')))
