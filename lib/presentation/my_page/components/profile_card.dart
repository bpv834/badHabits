import 'package:bhgh/domain/model/user_model.dart';
import 'package:flutter/material.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({super.key, required this.user});

  final UserModel user;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      margin: EdgeInsets.all(16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // User's Name
            Row(
              children: [
                Icon(Icons.person, color: Theme.of(context).primaryColor),
                SizedBox(width: 8),
                Text(
                  'Nickname: ${user.name}',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
            SizedBox(height: 8),

            // User's Age
            Row(
              children: [
                Icon(Icons.cake, color: Theme.of(context).primaryColor),
                SizedBox(width: 8),
                Text(
                  'Age: ${user.age}',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            SizedBox(height: 8),

            // User's Main Habit
            Row(
              children: [
                Icon(Icons.star, color: Theme.of(context).primaryColor),
                SizedBox(width: 8),
                Text(
                  'Main Habit: ${user.mainHabit}',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),

            // User's Habits with ExpansionTile
            user.habits.isNotEmpty
                ? ExpansionTile(
              title: Text(
                'Show Habits (${user.habits.length})',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontSize: 14,
                ),
              ),
              children: user.habits.map((habit) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: Row(
                  children: [
                    Icon(Icons.check_circle, color: Colors.green, size: 16),
                    SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        '- $habit',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontSize: 14,
                        ),
                        overflow: TextOverflow.ellipsis, // 긴 텍스트를 잘라서 표시
                      ),
                    ),
                  ],
                ),
              )).toList(),
            )
                : Text(
              'No habits available',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
