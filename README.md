# Godot-Animation-selector
Dropdown selection for AnimationTree animations

The plugin works by finding the animation nodes in a AnimationTree set to AnimationNodeStateMachine, and displaying them as a dropdown menu on any node with a exported string variable called "animation".

Requirements:
- A node needs to export an `animation` variable of type String. It should default to "End" to make sure it is always valid as default and will not start an animation unless set.

  Example:
    ```
    extends Node
    class_name Action
    @export var animation := "End"
    ```
- The code in the `_set_animation_tree(node:Node)` function found in `treefinder.gd` must be modified to fit the given project and structure.
  It needs to return the desired AnimationTree node through the selected node. This can be done by having a reference to the relevant AnimationTree on the node together with the `animation` variable, or some other method depending on the project.
