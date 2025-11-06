import requests # type: ignore
from player import Player

def main():
    url = "https://studies.cs.helsinki.fi/nhlstats/2024-25/players"
    response = requests.get(url).json()

    players = []

    for player_dict in response:
        
        player = Player(player_dict)
        players.append(player)

    wanted_nationality = "FIN"
    national_players = []
    print(wanted_nationality)

    for player in players:
        if player.nationality == wanted_nationality:
            national_players.append(player)

    national_players.sort(key=lambda player: player.points, reverse=True)

    for player in national_players:
        print(player)

if __name__ == "__main__":
    main()