-Xpenses APP
A simple Expense Tracker App

- The app has 2 views, the home view labeled with a navigation title “Xpenses” and a ‘plus’ sign button that triggers the second view which is a sheet where the user can add a new expense, the cost and the category. When he finishes he can tap the ‘Save’ button on the top bar trailing.
- Using the .append modifier we are able to append the new items to the items array, and display on the home view in a list format.
- Data Persistance: In our view model adding a Didset as property observer we will watch every time an item is added using the Coddle protocol and UserDefaults we are able to archive the expenses, save them, and load them.

<video src="https://github.com/jpenvoyage/Xpenses/assets/126640755/2d4dcc17-e872-4ab6-8cbd-4890eba54345"></video>

What I still want to implement

- Refactor some of the code
- Filter Expenses by keywords
- Sort expenses by date or amount in the oder ascending/descending
