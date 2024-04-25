#!/usr/bin/python3
"""json format export."""
import json
import requests


if __name__ == "__main__":
    employees = requests.get('https://jsonplaceholder.typicode.com/users').json()

    employee_dict = {}
    for employee in employees:
        todos = requests.get('https://jsonplaceholder.typicode.com/todos?userId={}'
                             .format(employee.get('id'))).json()

        tasks = []
        for task in todos:
            task_dict = {
                'username': employee.get('username'),
                'task': task.get('title'),
                'completed': task.get('completed')
            }
            tasks.append(task_dict)

        employee_dict['{}'.format(employee.get('id'))] = tasks

    with open('todo_all_employees.json', 'w') as file:
        json.dump(employee_dict, file)
