/datum/action/cooldown/spell/undirected/barbrage
	name = "Rage"
	desc = "Enter a state of martial fervour, increasing offensive capabilities at the cost of making yourself vulnerable."
	button_icon_state = "bcry"
	sound = 'sound/magic/barbroar.ogg'

	antimagic_flags = NONE

	charge_required = FALSE
	has_visual_effects = FALSE
	cooldown_time = 1 MINUTES

	spell_type = SPELL_NONE
	stamina_cost = 10

/datum/action/cooldown/spell/undirected/barbrage/can_cast_spell(feedback)
	. = ..()
	if(!.)
		return

	if(!isliving(owner))
		if(feedback)
			to_chat(owner, span_warning("I can't seem to get angry..."))
		return FALSE

/datum/action/cooldown/spell/undirected/barbrage/cast(mob/living/cast_on)
	. = ..()
	cast_on.emote("rage", forced = TRUE)
	cast_on.apply_status_effect(/datum/status_effect/buff/barbrage)
