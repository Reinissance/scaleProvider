A set of MIDI-only plugins for [plugdata](https://plugdata.org/) that analyze MIDI input for musical chords and provide the associated scale. These scales are then used to play back sequences in the corresponding harmony.

### Who is this for?

This is for anyone who wants to intuitively create live music by recording and looping their own playing. Since the provided data is shared over a network using the `pdlink` external, these plugins can also be used to collaborate on music across different devices while sharing common harmonies. For example, you can use this application to create live music by looping a bassline that harmonically follows your piano playing.

### Contents

Currently, there are three plugins:

- **scaleProvider:** Analyzes incoming MIDI messages and provides the corresponding scale over the network. It can also globally control presets in other plugins and manage some DAW parameters via MIDI loopback.
- **scaleFollowingSeq:** A sequencer with seven "notes" defined as root, 9th, third, 11th, fifth, etc., which follow the provided harmonic context.
- **scaleDrumSeq:** A drum sequencer that does not follow the provided scales.her midi

### Prerequisites

- A digital audio workstation (DAW).
- [plugdata](https://plugdata.org/download.html) installed.

### How to Use

1. **Using the scaleProvider plugin:**
    - Create a MIDI track, load a `plugdata-fx` instance onto it, and open the `scaleProvider` plugin.
    - Select your keyboard as the MIDI input or create a MIDI track with pre-recorded data.
    - Create another MIDI track, set the previous track's MIDI output as its input, and load an instrument for audio generation or route the output to your GM device.

2. **Using the scaleFollowingSeq plugin:**
    - Create a MIDI track, load a `plugdata-fx` instance onto it, and open the `scaleFollowingSeq` plugin.
    - Create another MIDI track, set the previous track's MIDI output as its input, and load an instrument for audio generation or route the output to your GM device.

3. **Using the scaleDrumSequencer plugin:**
    - Create a MIDI track, load a `plugdata-fx` instance onto it, and open the `scaleFollowingSeq` plugin.
    - Create another MIDI track, set the previous track's MIDI output as its input, and load an drum-instrument for audio generation or route the output to your GM device.

4. **Creating presets**
    - In both the scaleFollowingSequencer and the scaleDrumSequencer you can create Presets by typing in a unique name for each. It stores the length of the sequence and the playbackspeed, randomness (which randomizes the playback positions to the given value) as well as the loaded drum-Note sounds in the scaleDrumSequencer and the MIDI-out range of the scaleFollowingSequencer (which defines the range in which the notes are played, at least one octave), and last but not least of course the "notes" within the sequencers itselfs.
    - The scaleProvider additionally can store his own presets, which on the one hand contains the DAW's BPM (see below) and the MIDI-in range (keys pressed outside this range on the connected midi-keyboard are ignored). Additionally it stores the currently selected Presets within all active scaleFollowingSequencers or drumSequencers.
    - The nice thing about plugdata is also that the presets are then stored within the DAW.

5. **Controlling the DAW's BPM**
    - In order to controll the DAW's BPM (and for it to be set from the presets) we need to create a MIDI-loopback: For mac users you can use the build in IAC-driver inside the Audio-MIDI-Setup.app, on windows you'll need something like [loopMIDI](https://www.tobias-erichsen.de/software/loopmidi.html) and linux users might use qjackqtl or other possibilities.
    - Create a another MIDI track with another plugdata instance, set the track's MIDI input to the scaleProvider's output and filter for midi Control 5 with scaleProvider/ctl5Filter. Then loop back the MIDI message to your DAW to control the bpm in the range of 50 - 177.
    - Both scaleFollowingSequencer and scaleDrumSequencer can set the BPM by recording a sequence while the DAW's playback is not jet running, so then once the DAW's playback starts it's bpm is set through the midi loopback. For this to work create another MIDI-track, take the desired plugin as input and route the MIDI-output to the loopback track above.

### Important Notes

- The `scaleProvider` and `scaleFollowingSeq` plugins must use different MIDI channels or devices.
- Use the device controlling the `scaleProvider` to define the harmonic context by pressing a chord. Then, with the device controlling the `scaleFollowingSeq`, you can play and record a bassline or other sequences that follow the defined harmonic context.
- Currently, the `scaleFollowingSeq` plugin plays back notes randomly selected within a range of at least one octave, which you can define.

### Detailed Documentation

Detailed documentation is coming soon. Stay tuned!
