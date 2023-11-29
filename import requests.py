import requests

from bs4 import BeautifulSoup
import csv

def scrape_avalance_posts(url):
    response = requests.get(url)
    if response.status_code == 200:
        soup = BeautifulSoup(response.text, 'html.parser')
        posts = []

        # Adjust the following code based on the structure of the website
        # For example, if each post is in a <div class="post">, you can modify the code accordingly.
        for post_elem in soup.find_all('div', class_='post'):
            title = post_elem.find('h2').text.strip()
            content = post_elem.find('div', class_='content').text.strip()

            posts.append({
                'Title': title,
                'Content': content,
            })

        return posts
    else:
        print(f"Failed to fetch content from {url}")
        return []

def save_to_csv(posts, csv_filename='avalanche_posts.csv'):
    fields = ['Title', 'Content']

    with open(csv_filename, mode='w', newline='') as csv_file:
        writer = csv.DictWriter(csv_file, fieldnames=fields)
        writer.writeheader()
        writer.writerows(posts)

if __name__ == "__main__":
    # Replace 'https://example.com/avalanche' with the actual URL of the website you want to scrape.
    url_to_scrape = 'https://nwac.us/'
    
    avalanche_posts = scrape_avalance_posts(url_to_scrape)

    if avalanche_posts:
        save_to_csv(avalanche_posts)
        print(f"Scraped {len(avalanche_posts)} avalanche-related posts and saved to 'avalanche_posts.csv'")
    else:
        print("No avalanche-related posts found.")
