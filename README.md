# challenge

Basic flutter project with a couple of advanced widgets.
## Getting Started


Class FirstChallenge
    - This class contains the first challenge, its baisccaly reordarblelist with dismissible functionality.
    we can reorder the list and delete any item by siwping it right or left.

    Each item of the reorderable list, should have a ValueKey, the ValueKey is based on the task title, after i converted the list of tasks to a map, so i can link things, based on key value pair.
    The main reason for choosing ValueKey over other keys like ObjectKey or UniqueKey is that it will allow me to identify the item i need, and it preserve the state of the widget its attached to.
    Now, the ValueKey is used in two places:
        1. In the ReorderableList widget as a Key for each item.
        2. As a key for the Map that holds all the tasks.
        3. In the Dismissible widget as a key for the item being dismissed.
        4. In the nested child of the Dismissible widget as a key for the child itself.

    Since we have a coupld of nested widgets Starting from top to bottom:
        1. ReorderableListView
        2. Dismissible
        3. Container
        4. Card
        5. ListTile
        6. Dialog
        7. SnackBar

    I needed a way where i can track the whole chain of widgets, and identify the present state so i can take actions based on that, therefore, the ValueKey was the best option.

    So for dimsising, im tracking the item being dismissed using the ValueKey, then i save the index(key) and the title (value) of the item being dismissed, then i remove it from the map, and rebuild the listview again, and finally i show a snackbar to confirm the deletion, also, undo the change, because i still have both task title and key (index in this case) saved.


    ## Demo Video

![Demo Video](./materials/first_challenge.gif)






Class SecondChallenge
    - This class challenge is based on using Draggable and DragTrget.
    The goal is to drag the draggable widget into one of the targets, if it matches the target color, then it will be accepted and the target shape will change to the draggable color, otherwise it will be rejected, and if we hover the draggable on the drag target we will show a prview and we wont accept it.   

    The class is based on two main widgets:

    ## Key Components

- **DraggableCircle Widget**: [View code](./lib/second_challenge.dart#L80-L94) 

- We pass there the initial data that we want to validate, and the color.
- Feedback basically is the shape that should appear we are dragging, it appers one we start dragging.
- ShapeWhenDragging is basically the shape that appears when we are dragging the widget.
- Child is basically the initial shape.

- **DragTargetWidget** : [View Code](./lib/second_challenge.dart#L96-L187)

- It takes color (to manage the colors in different conditions)
- acceptedValue (the value which we are considering as true for the validation condition)
- isAccepted (boolean flag to check if the value is valid or not)
- onAccepted (this function is called when the value is accepted)

Now inside it we have 4 conditions checked in this order:
1. If the value is rejected and hovered, we show the rejected shape.
2. If the value is accepted (permanently), we show the accepted shape.
3. If the correct value is hovered, we show the preview shape.
4. If none of these conditions are met, we show the default shape.


![Demo Video](./materials/second_challenge.gif)
