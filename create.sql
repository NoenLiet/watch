CREATE TYPE event_t AS enum('kick', 'ban', 'unban', 'role_add', 'role_remove');

CREATE TABLE IF NOT EXISTS guild_configs(
    guild_id bigint PRIMARY KEY,
    post_channel bigint,
    prefix text DEFAULT '!',
    options integer DEFAULT 0,
    latest_event_count integer,
    special_roles bigint[],
    recent_events bigint[],
    _offset integer DEFAULT 0
);

CREATE TABLE IF NOT EXISTS events(
    event_id integer,
    guild_id bigint REFERENCES guild_configs(guild_id),
    event_type event_t,
    reason text,
    timestamp TIMESTAMP,
    message_id bigint,
    target_id bigint,
    target_name text,
    actor bigint,
    role_id bigint,
    role_name text,
    PRIMARY KEY (event_id, guild_id)
);