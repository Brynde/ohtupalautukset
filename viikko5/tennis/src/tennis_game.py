class TennisGame:
    def __init__(self, player1_name, player2_name):
        self.player1_name = player1_name
        self.player2_name = player2_name
        starting_score = 0
        self.player1_score = starting_score
        self.player2_score = starting_score

    def won_point(self, player_name):
        if player_name == self.player1_name:
            self.player1_score += 1
        else:
            self.player2_score += 1

    def get_score(self):
        score1 = self.player1_score
        score2 = self.player2_score

        if score1 == score2:
            score = self.check_even_score(score1)

        elif score1 >= 4 or score2 >= 4:
            score = self.check_advantage_or_win(score1, score2)

        else:
            score = self.game_state(score1, score2)

        return score

    def check_even_score(self, score):
        if score == 0:
            return "Love-All"
        elif score == 1:
            return "Fifteen-All"
        elif score == 2:
            return "Thirty-All"
        else:
            return "Deuce"

    def check_advantage_or_win(self, score1, score2):
        score_difference = score1 - score2
        if score_difference == 1:
            return "Advantage player1"
        elif score_difference == -1:
            return "Advantage player2"
        elif score_difference >= 2:
            return "Win for player1"
        else:
            return "Win for player2"
    
    def game_state(self, score1, score2):
        score_names = {0: "Love", 1: "Fifteen", 2: "Thirty", 3: "Forty"}
        name1 = score_names[score1]
        name2 = score_names[score2]
        return f"{name1}-{name2}"