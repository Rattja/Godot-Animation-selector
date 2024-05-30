extends Object
class_name AnimationTreeFinder

## Finds the animation tree that is relevant for the given node.[br]
## This method must be modified to fit the given project structure.[br]
static func set_animation_tree(node:Node) -> AnimationTree:
	# Example:
	var animation_tree : AnimationTree = node.animation_tree
	if !animation_tree:
		return null
	return animation_tree
