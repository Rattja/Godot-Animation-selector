extends Object
class_name AnimationTreeFinder

## Finds the animation tree that is relevant for the given node.[br]
## This method must be modified to fit the given project structure.[br]
static func _set_animation_tree(node:Node) -> AnimationTree:
	var animator = node.owner.get_component(AnimatorComponent)
	var animation_tree : AnimationTree = animator.anim_tree
	if !animator:
		return null
	if !animation_tree:
		return null
	return animation_tree
