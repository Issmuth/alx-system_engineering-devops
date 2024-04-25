#!/usr/bin/python3
"""CSV format."""
import csv
import requests
import sys


if __name__ == "__main__":
    employee = requests.get('https://jsonplaceholder.typicode.com/users/{}'
                            .format(sys.argv[1])).json()

    todos = requests.get('https://jsonplaceholder.typicode.com/todos?userId={}'
                         .format(sys.argv[1])).json()

    with open('{}.csv'.format(sys.argv[1]), 'w') as file:
        writer = csv.writer(file)

        for task in todos:
            writer.writerow(['{}'.format(sys.argv[1]),
                             '{}'.format(employee.get('username')),
                             '{}'.format(task.get('completed')),
                             '{}'.format(task.get('title'))])
