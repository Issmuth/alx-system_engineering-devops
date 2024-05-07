#!/usr/bin/python3
"""Retrives the number of subscribers in a subreddit."""
import requests


def number_of_subscribers(subreddit):
    """number of subscribers."""
    if subreddit is None:
        return 0

    url = "https://www.reddit.com/r/{}/.json".format(subreddit)
    header = {"user-agent": "Chrome/124.0.0.0"}
    response = requests.get(url, headers=header)

    if response.status_code == 400:
        return 0

    data = response.json().get('data').get('children')
    try:
        return data[0].get('data').get('subreddit_subscribers')
    except IndexError:
        return 0
