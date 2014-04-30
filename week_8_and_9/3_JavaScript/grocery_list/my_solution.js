// U3.W8-9: 


// I worked on this challenge Andra Lally and C.J. Jameson.

// 2. Pseudocode

// First create object groceries (with an empty array for the list)
// Create an add function variable (arguments: )
// Create a delete function variable (argument: )within the groceries object
// Display function variable within the groceries object
// Num_of_items function variable
// include function variable (argument: )

// 3. Initial Solution

// var groceries = {
//   foods: [],

//   add_food: function(food) {
//     this.foods.push(food);
//   },

//   delete_food: function(food){
//     var index = this.foods.indexOf(food);
//     this.foods.splice(index,1);
//   },

//  display: function() {
//     var output = 'My foods are: '
//    for (var i = 0; i < this.foods.length; i++) {
//      output += this.foods[i] + ' ';
//    };
//    console.log(output);
//  },

// num_of_items: function(){
//   return this.foods.length;
// },

// include: function(food){
//   return this.foods.indexOf(food) >= 0;
// }

// };

// 4. Refactored Solution


var groceries = {
 list: [],

 add_item: function(item) {
   this.list.push(item);
 },

 delete_item: function(item){
   var index = this.list.indexOf(item);
   this.list.splice(index,1);
 },

 look_at_list: function() {
   var output = 'My list is: ';
  for (var i = 0; i < this.list.length; i++) {
    output += this.list[i] + ' ';
  }

  console.log(output);

},

 num_of_items: function(){
  return this.list.length;
},

 is_included: function(item){
  return this.list.indexOf(item) >= 0;
}

};

// 1. DRIVER TESTS/ASSERT STATEMENTS GO BELOW THIS LINE

groceries.add_item("apple");
groceries.add_item("ham");
groceries.delete_item("ham");
groceries.look_at_list();
groceries.num_of_items();
console.log(groceries.is_included("apple"));
console.log(!groceries.is_included("rice"));
console.log(groceries.list);

// 5. Reflection