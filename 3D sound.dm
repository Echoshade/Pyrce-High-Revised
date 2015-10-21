var/const
	_channel_reserve_start = 756
	_channel_reserve_end = 1024

var/list/_autotune_soundmobs = null

proc
	_addAutotuneSoundmob(soundmob/soundmob)
		if(!(soundmob in _autotune_soundmobs))
			if(!_autotune_soundmobs) _autotune_soundmobs = list()
			_autotune_soundmobs += soundmob

			soundmob.broadcast(world)

	_removeAutotuneSoundmob(soundmob/soundmob)
		if(soundmob in _autotune_soundmobs)
			_autotune_soundmobs -= soundmob
			if(!length(_autotune_soundmobs)) _autotune_soundmobs = null

	soundmob(atom/movable/attached, radius = 0, file, autotune = FALSE, channel = 0, volume = 100)
		ASSERT(attached && file)

		return new/soundmob(attached, radius, file, autotune, channel, volume)

soundmob
	var
		atom/movable/attached = null
		list/listeners = null

		file = null
		autotune = FALSE
		channel = 0

		radius = 0

		volume = 100
		frequency = 0
		pan = 0

		priority = 0

		environment = -1
		list/echo = null

	New(atom/movable/_attached, _radius = 0, _file, _autotune = FALSE, _channel = 0, _volume = 100)
		ASSERT(_attached && _file && _radius)

		attached = _attached

		if(_file) file = _file
		if(_radius) radius = _radius
		if(_autotune) autotune = _autotune
		if(_channel) channel = _channel
		if(_volume) volume = _volume

		_attached._attachSoundmob(src)

		if(autotune) _addAutotuneSoundmob(src)

	Del()
		attached._detachSoundmob(src)
		if(autotune) _removeAutotuneSoundmob(src)
		unsetListeners()

	proc
		broadcast(target = world)
			for(var/mob/mob in target) if(mob.client) mob.listenSoundmob(src)

		unsetListeners()
			if(listeners) for(var/mob/mob in listeners) unsetListener(mob)

		updateListeners()
			if(listeners) for(var/mob/mob in listeners) updateListener(mob)

		updateListener(mob/mob)
			ASSERT(attached)
			if(!mob.client)return
			if(!mob.logged==1)return
			ASSERT(mob)
			ASSERT(mob.client)
			ASSERT(src in mob._listening_soundmobs)

			if(!mob._listening_soundmobs[src])
				var/sound/s = new(file)
				mob._listening_soundmobs[src] = s

			var/sound/sound = mob._listening_soundmobs[src]

			//if(!sound.channel) sound.channel = mob._getAvailableChannel()
			//if(!(sound.channel in mob._channels_taken)) mob._lockChannel(sound.channel)

			sound.repeat = FALSE

			// I'm not using sound.x, y, and z because you aren't really able to set a maximum distance using those.
			// You're always able to hear the sound atleast a little regardless of how far it is away.
			// This could probably be improved a bit.

			if(mob.x == attached.x) sound.pan = 0
			if(mob.x > attached.x) sound.pan = -75
			if(mob.x < attached.x) sound.pan = 75

			var/distance = sqrt((mob.x - attached.x) * (mob.x - attached.x) + (mob.y - attached.y) * (mob.y - attached.y))
			sound.volume = volume - (distance / radius * volume)

			sound.frequency = frequency

			sound.priority = priority

			sound.environment = environment
			//sound.echo = echo
//			var/derp=get_dist(mob.x,attached.x)
//			if(derp>11) sound.volume = 0
			if(mob.z > attached.z) sound.volume = 0
			if(mob.z < attached.z) sound.volume = 0
			sound.status = SOUND_UPDATE
			if(mob.mutesfx==1)goto nosound
			mob << sound
			:nosound

		setListener(mob/mob)
			if(!mob.client)return
			if(!mob.logged==1)return
			ASSERT(mob.client)

			if(!(mob in listeners))
				if(!listeners) listeners = list()
				listeners += mob

				updateListener(mob)

		unsetListener(mob/mob)
			if(mob in listeners && src in mob._listening_soundmobs)
				var/sound/sound = mob._listening_soundmobs[src]
				if(mob.mutesfx==1)goto nosound
				for(var/i = sound.volume, i >= 0, i --)
					sound.status = SOUND_UPDATE
					sound.volume = i

					mob << sound

					sleep(1)

				mob << sound(null, 0, 0, sound.channel)
				mob._unlockChannel(sound.channel)
				:nosound
				listeners -= mob
				if(!length(listeners)) listeners = null

atom/movable
	var/list/_attached_soundmobs = null

	Del()
		if(_attached_soundmobs) for(var/soundmob/soundmob in _attached_soundmobs) del(soundmob)

		..()

	//Move()
	//	..()
//
	//	_updateAttachedSoundmobListeners()

	proc
		_attachSoundmob(soundmob/soundmob)
			if(!(soundmob in _attached_soundmobs))
				if(!_attached_soundmobs) _attached_soundmobs = list()
				_attached_soundmobs += soundmob

		_detachSoundmob(soundmob/soundmob)
			if(soundmob in _attached_soundmobs)
				_attached_soundmobs -= soundmob
				if(!length(_attached_soundmobs)) _attached_soundmobs = null

		_updateAttachedSoundmobListeners()
			if(_attached_soundmobs) for(var/soundmob/soundmob in _attached_soundmobs) soundmob.updateListeners()

mob
	var
		list/_listening_soundmobs = null
		list/_channels_taken = null

	New()
		..()

		spawn() if(client && _autotune_soundmobs) for(var/soundmob/soundmob in _autotune_soundmobs) listenSoundmob(soundmob)

	Del()
		if(_listening_soundmobs) for(var/soundmob/soundmob in _listening_soundmobs) unlistenSoundmob(soundmob)

		..()

//	Move()
//		..()
//
//		_updateListeningSoundmobs()

	proc
		_unlockChannel(channel)
			if(channel in _channels_taken)
				_channels_taken -= channel
				if(!length(_channels_taken)) _channels_taken = null

		_lockChannel(channel)
			if(!(channel in _channels_taken))
				if(!_channels_taken) _channels_taken = list()
				_channels_taken += channel

		_updateListeningSoundmobs()
			if(_listening_soundmobs)
				for(var/soundmob/soundmob in _listening_soundmobs)
					soundmob.updateListener(src)

		_getAvailableChannel()
			for(var/channel = _channel_reserve_start, channel <= _channel_reserve_end, channel ++)
				if(!(channel in _channels_taken)) return channel

			CRASH("You've managed to use a ridiculous number of channels. You're doing it wrong.")

		listenSoundmob(soundmob/soundmob)
			if(!(soundmob in _listening_soundmobs))
				if(!_listening_soundmobs) _listening_soundmobs = list()
				_listening_soundmobs += soundmob
				soundmob.setListener(src)

		unlistenSoundmob(soundmob/soundmob)
			if(soundmob in _listening_soundmobs)
				var/sound/sound = _listening_soundmobs[soundmob]
				_channels_taken -= sound.channel

				_listening_soundmobs -= soundmob
				if(!length(_listening_soundmobs)) _listening_soundmobs = null
				soundmob.unsetListener(src)