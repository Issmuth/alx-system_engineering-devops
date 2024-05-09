#!/usr/bin/python3
"""
Retrives the number of subscribers in a subreddit.
"""
import requests


def number_of_subscribers(subreddit):
    """number of subscribers."""

    url = "https://www.reddit.com/r/{}/.json".format(subreddit)
    header = {"user-agent": "linux:0x16.api.advanced:v1.0.0 (by /u/bdov_)"}
    response = requests.get(url, headers=header, allow_redirects=False)

    if response.status_code == 404:
        return 0

    try:
        data = response.json().get('data').get('children')
        return data[0].get('data').get('subreddit_subscribers')
    except Exception:
        return 0
