# Challenge

Basic Flutter project with a couple of advanced widgets.
## Getting Started


### Class FirstChallenge
    - This class contains the first challenge, it's basically ReorderableList with dismissible functionality.
    We can reorder the list and delete any item by swiping it right or left.

    Each item of the reorderable list should have a ValueKey. The ValueKey is based on the task title, after I converted the list of tasks to a map, so I can link things based on key-value pairs.
    The main reason for choosing ValueKey over other keys like ObjectKey or UniqueKey is that it allows me to identify the item I need, and it preserves the state of the widget it's attached to.
    Now, the ValueKey is used in these places:
        1. In the ReorderableList widget as a Key for each item.
        2. As a key for the Map that holds all the tasks.
        3. In the Dismissible widget as a key for the item being dismissed.
        4. In the nested child of the Dismissible widget as a key for the child itself.

    Since we have a couple of nested widgets starting from top to bottom:
        1. ReorderableListView
        2. Dismissible
        3. Container
        4. Card
        5. ListTile
        6. Dialog
        7. SnackBar

    I needed a way where I can track the whole chain of widgets and identify the present state so I can take actions based on that; therefore, the ValueKey was the best option.

    So for dismissing, I'm tracking the item being dismissed using the ValueKey, then I save the index (key) and the title (value) of the item being dismissed, then I remove it from the map and rebuild the ListView again. Finally, I show a Snackbar to confirm the deletion, also allowing the user to undo the change because I still have both task title and key (index in this case) saved.

- **First challenge Class**: [View Code](./lib/first_challenge.dart#L5-L123)

## Demo Video

<div align="center">
  <a href="./materials/first_challenge.mp4" title="First Challenge Demo">
    <img src="https://img.shields.io/badge/Watch-First%20Challenge%20Demo-blue?style=for-the-badge&logo=github" alt="Watch First Challenge Demo">
  </a>
  <br>
  <em>First Challenge - ReorderableList with Dismissible</em>
</div>



https://github.com/user-attachments/assets/0aaed4c5-687a-4eed-858b-071f0492a338





### Class SecondChallenge
    - This class challenge is based on using Draggable and DragTarget.
    The goal is to drag the draggable widget into one of the targets. If it matches the target color, then it will be accepted and the target shape will change to the draggable color; otherwise, it will be rejected. If we hover the draggable over the drag target, we will show a preview but won't accept it.

    The class is based on two main widgets:

    #### Key Components

- **DraggableCircle Widget**: [View code](./lib/second_challenge.dart#L80-L94) 

- We pass the initial data that we want to validate, and the color.
- Feedback is the shape that should appear when we are dragging; it appears once we start dragging.
- ShapeWhenDragging is the shape that appears when we are dragging the widget.
- Child is the initial shape.

- **DragTargetWidget**: [View Code](./lib/second_challenge.dart#L96-L187)

- It takes color (to manage the colors in different conditions)
- acceptedValue (the value which we are considering as true for the validation condition)
- isAccepted (boolean flag to check if the value is valid or not)
- onAccepted (this function is called when the value is accepted)

Now inside it we have 4 conditions checked in this order:
1. If the value is rejected and hovered, we show the rejected shape.
2. If the value is accepted (permanently), we show the accepted shape.
3. If the correct value is hovered, we show the preview shape.
4. If none of these conditions are met, we show the default shape.

<div align="center">
  <a href="./materials/second_challenge.mp4" title="Second Challenge Demo">
    <img src="https://img.shields.io/badge/Watch-Second%20Challenge%20Demo-blue?style=for-the-badge&logo=github" alt="Watch Second Challenge Demo">
  </a>
  <br>
  <em>Second Challenge - Drag and Drop</em>
</div>







### Class ThirdChallenge
    - This class builds a simple animation loader of 3 dots using animation controller, tween and animation builder.
    Animation builder has same values for beginning and end which controls the size of the widget at its beginning and end states.
    Tween is used to control the opacity of the dot while animating between beginning and end states, also to control the delay between animations using Interval property of Curve.

    - I used AnimatedBuilder to build the desired widget, which transitions from a small container with opacity to a bigger one without.



## Demo Video For the Actual Challenge


<div align="center">
  <a href="./materials/third_challenge_actual.mp4" title="Third Challenge Demo">
    <img src="https://img.shields.io/badge/Watch-Third%20Challenge%20Demo-blue?style=for-the-badge&logo=github" alt="Watch Third Challenge Demo">
  </a>
  <br>
  <em>Third Challenge - Loader</em>
</div>





[View Code](./lib/third_challenge.dart#L104-L193)

### Class ThirdChallengeSimple

    - Here I just wanted to implement the same animation using a simpler way, just to show there are different ways of achieving the same thing.
    - I just used built-in animations, with AnimatedContainer, linked each container to a different bool value.
    - In the init state, the bool values of the 3 containers update sequentially.

## Demo Video For the Simple Version

<div align="center">
  <a href="./materials/third_challenge_simple.mp4" title="Third Challenge Simple Demo">
    <img src="https://img.shields.io/badge/Watch-Third%20Challenge%20Simple%20Demo-blue?style=for-the-badge&logo=github" alt="Watch Third Challenge Simple Demo">
  </a>
  <br>
  <em>Third Challenge - Loader Simple</em>
</div>



