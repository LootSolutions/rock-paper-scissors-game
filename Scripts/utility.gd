extends Node

enum WinState {
	Win,
	Loss,
	Tie
}

enum Moves {
	Rock,
	Paper,
	Scissors
}


static func move_enum_to_string(move) -> String:
	match move:
		Moves.Rock: return "Rock"
		Moves.Paper: return "Paper"
		Moves.Scissors: return "Scissors"
		_: return "INVALID"


static func get_winner(player_choice, cpu_choice):
	if player_choice == cpu_choice:
		return WinState.Tie
	elif player_choice == Moves.Rock && cpu_choice == Moves.Paper:
		return WinState.Loss
	elif player_choice == Moves.Paper && cpu_choice == Moves.Scissors:
		return WinState.Loss
	elif player_choice == Moves.Scissors && cpu_choice == Moves.Rock:
		return WinState.Loss
	
	return WinState.Win
