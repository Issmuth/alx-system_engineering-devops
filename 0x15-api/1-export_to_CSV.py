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
        writer = csv.writer(file, quoting=csv.QUOTE_ALL)

        for task in todos:
            writer.writerow([sys.argv[1],
                             (employee.get('username')),
                             (task.get('completed')),
                             (task.get('title'))])
