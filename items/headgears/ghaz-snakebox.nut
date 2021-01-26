local info = {
    name = "Cardboard Box"
    description = "A sturdy cardboard box useful for sneaking around."
    prop = "actors/headgear/ghaz-snakebox.xml"
    prop_bone = "head"
    prop_mount_scale = "1.20"
    prop_mount_angle_x = "0"
    prop_mount_angle_y = "0"
    prop_mount_angle_z = "0"
    prop_mount_offset_x = "0"
    prop_mount_offset_y = "-5"
    prop_mount_offset_z = "20"
};

local modifiers = {
    enemy_aggro_range_percentage_decrease = 80.0
    running_speed_percentage_increase = -75.0
    melee_damage_percentage_increase = -100.0
};

function OnMetadataRead() {
    return info;
}

function OnModifiersRead() {
    return modifiers;
}

function OnEquipped() {
    // Get the player.
    local player = Game_GetPrimaryPlayerActor();
    // Game_AddActorNotification(player, "OnEquipped");

    // Hide the currently-equipped tool.
    Stage_SendStageObjectCommandWord(player, "show_and_hide_tool", false);
}

function OnUnequipped() {
    // Get the player.
    local player = Game_GetPrimaryPlayerActor();
    // Game_AddActorNotification(player, "OnUnequipped");

    // Show the currently-equipped tool.
    Stage_SendStageObjectCommandWord(player, "show_and_hide_tool", true);
    Actor_QueueActionPlayAnimation(player, "tool_equip");
}

function OnUpdate(tdelta) {
    // Get the player.
    local player = Game_GetPrimaryPlayerActor();
    // Game_AddActorNotification(player, "OnUpdate");

    // Hide the currently-equipped tool.
    Stage_SendStageObjectCommandWord(player, "show_and_hide_tool", false);

    // If an additive idle animation is playing...
    if (Actor_IsAnimationPlaying(player, "idle-2")) {
        Game_StopAnimationByAction(player, "idle-2");
    } else if (Actor_IsAnimationPlaying(player, "idle-3")) {
        Game_StopAnimationByAction(player, "idle-3");
    }

    // local upgrade_level = Game_GetRecipeUpgradeLevel("GHAZ_SNAKEBOX");
    // Game_AddActorNotification(player, upgrade_level + "!");

    // local pos = StageObject_GetPosition(player);
    // local so_tool = Game_GetEquippedItemInActiveSlot(so_player, "TOOLS");
}