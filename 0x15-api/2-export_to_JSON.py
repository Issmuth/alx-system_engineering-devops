#!/usr/bin/python3
"""json format export."""
import json
import requests
import sys


if __name__ == "__main__":
    employee = requests.get('https://jsonplaceholder.typicode.com/users/{}'
                            .format(sys.argv[1])).json()

    todos = requests.get('https://jsonplaceholder.typicode.com/todos?userId={}'
                         .format(sys.argv[1])).json()

    employee_dict = {}
    tasks = []
    for task in todos:
        task_dict = {
            'task': task.get('title'),
            'completed': task.get('completed'),
            'username': employee.get('username')
        }
        tasks.append(task_dict)

    employee_dict['{}'.format(sys.argv[1])] = tasks
    with open('{}.json'.format(sys.argv[1]), 'w') as file:
        json.dump(employee_dict, file)
