#!/usr/bin/python3
"""Retrives the hot posts in a subreddit."""
import requests


def top_ten(subreddit):
    """number of subscribers."""
    if subreddit is None:
        print("None")
        return

    url = "https://www.reddit.com/r/{}/hot/.json".format(subreddit)
    header = {"user-agent": "Chrome/124.0.0.0"}
    parameter = {"limit": 10}
    response = requests.get(url,
                            headers=header,
                            params=parameter,
                            allow_redirects=False)

    if response.status_code == 404:
        print("None")
        return

    data = response.json().get('data').get('children')
    for post in data:
        print(post.get('data').get('title'))
