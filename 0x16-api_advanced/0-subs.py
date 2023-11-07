#!/usr/bin/python3
import requests


def number_of_subscribers(subreddit):
    # Reddit API URL for fetching subreddit information
    url = f"https://www.reddit.com/r/{subreddit}/about.json"

    # Set a custom User-Agent to prevent Too Many Requests error
    headers = {
            'User-Agent': 'MyRedditBot/1.0 (by YourUsername)'
            }
    try:
        response = requests.get(url, headers=headers)
        data = response.json()

        # Check if the subreddit exists

        if 'data' in data and 'subscribers' in data['data']:
            return data['data']['subscribers']
        else:
            return 0  # Invalid subreddit or other error
        except Exception:
            return 0  # Error occurred

        if __name__ == '__main__':

            import sys
    if len(sys.argv) < 2:
        print("Please pass an argument for the subreddit to search.")
    else:
        subreddit = sys.argv[1]
        subscribers = number_of_subscribers(subreddit)
        print(subscribers)
