# Flutter_quiz_app

## Overview
This is a comprehensive quiz application developed using Flutter. The app integrates with Firebase for authentication and Cloud Firestore for data storage. The quiz app features an admin panel for managing quiz questions and includes quizzes for four subjects: NLP (Natural Language Processing), ML (Machine Learning), BDA (Big Data Analytics), and Blockchain. The app also stores quiz results for users.

## Features
- **User Authentication**: Secure user authentication using Firebase Authentication.
- **Quiz Management**: Admin panel to add and delete quiz questions.
- **Cloud Storage**: Quiz data and results are stored in Firebase Cloud Firestore.
- **Subjects**: Quizzes are available for four subjects:
  - NLP (Natural Language Processing)
  - ML (Machine Learning)
  - BDA (Big Data Analytics)
  - Blockchain
- **Result Tracking**: User quiz results are stored and can be accessed later.

## Installation

1. **Clone the Repository**:
   ```bash
   git clone https://github.com/devishree2305/Flutter_quiz_app.git
   cd Flutter_quiz_app

## Install Dependencies

flutter pub get

## Run the app

flutter run

## Usage

- **Admin Panel**: Accessible to authenticated users with @admin.com account id. Admins can add new quiz questions and delete existing ones.
- **Take a Quiz**: Users can select a subject and take a quiz. Results are stored in Firebase Cloud Firestore.

## Screenshots

- **Student login**
  <div style="display: flex; justify-content: space-between;">
  <img src="https://github.com/devishree2305/Flutter_quiz_app/blob/main/Screenshots/Student_page.jpg" alt="Student login" width="200" />
  <img src="https://github.com/devishree2305/Flutter_quiz_app/blob/main/Screenshots/Quiz_page.jpg" alt="Quiz Page" width="200" />
  <img src="https://github.com/devishree2305/Flutter_quiz_app/blob/main/Screenshots/Settings.jpg" alt="Settings" width="200" />
  <img src="https://github.com/devishree2305/Flutter_quiz_app/blob/main/Screenshots/Result_page.jpg" alt="Result Page" width="200" />
</div>

- **Admin Pane**
  <div style="display: flex; justify-content: space-between;">
  <img src="https://github.com/devishree2305/Flutter_quiz_app/blob/main/Screenshots/Admin_panel.jpg" alt="Admin Panel" width="200" />
  <img src="https://github.com/devishree2305/Flutter_quiz_app/blob/main/Screenshots/Student_aattended_quizzes.jpg" alt="Student attended quiz" width="200" />
  <img src="https://github.com/devishree2305/Flutter_quiz_app/blob/main/Screenshots/add_question.jpg" alt="Add questions" width="200" />
  <img src="https://github.com/devishree2305/Flutter_quiz_app/blob/main/Screenshots/Delete_question.jpg" alt="Delete questions" width="200" />
</div>


