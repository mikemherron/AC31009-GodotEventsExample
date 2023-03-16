## AC31009 Week 8 - Event Driven Programming - Godot Example
This the small sample project used in the Week 8 seminar on Event Driven Programming. 

In the `main` branch, you'll see the Player Controller is responsible for updating the UI and removing the enemy objects on death. In the `refactor-events` branch, the Player Controller instead uses a signal, `player_hit`, to indicate when the player has taken damange. Game and UIController nodes listen for this event, configured in the Godot Editor, and make the required changes.