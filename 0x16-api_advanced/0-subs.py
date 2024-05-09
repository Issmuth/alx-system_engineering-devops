#!/usr/bin/python3
"""
Retrives the number of subscribers in a subreddit.
"""
import requests


def number_of_subscribers(subreddit):
    """number of subscribers."""

    url = "https://www.reddit.com/r/{}/.json".format(subreddit)
    header = {"user-agent": "Chrome/124.0.0.0"}
    response = requests.get(url, headers=header, allow_redirects=False)

    if response.status_code != 200:
        return 0

    try:
        data = response.json().get('data').get('children')
        return data[0].get('data').get('subreddit_subscribers')
    except Exception:
        return 0