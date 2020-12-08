##| Author: Roger Trejio
##| Project: Hakuna Fermata
##| Date: 12/7/20


#chord variables
chords = [(chord :C, :minor7), (chord :Ab, :major7), (chord :Eb, :major7), (chord :Bb, "7")]
c = chords[0]

#live loop that continues, as a relaxtion
live_loop :start_off do
  #play chorus melody
  play chord(:g, :major), attack: 1, release: 2
  [1, 3, 6, 4].each do |d|
    play chord(:e, :major), attack: 2, release: 2
    [1, 3, 6, 4].each do |d|
      play chord(:c, :major), attack: 2, release: 2
      (range -2, 2).each do |i|
        play_chord (chord_degree d, :e, :major, 3, invert: i)
        sleep 1
      end
    end
    #add chorus fixation to change scale slightly to transition nicer
    play chord(:e, :major), attack: 1, release: 2
    (range 0, 4).each do |i|
      play_chord (chord_degree d, :e, :major, 3, invert: i)
      sleep 1
    end
    #transitioning notes to play for the scale
    play chord(:c, :major7)
    sleep(1)
    play chord(:g, :major7)
    sleep(1)
    play chord(:a, :m7)
    sleep(1)
    
    # chords and also changing the different times for release after every iteration
    r = [0.25, 0.25, 0.5, 1].choose
    play c.choose, attack: 0, release: r
    
    
    #using chord notes as a transition from previous notes into scale
    play c[0]
    sleep 1
    play c[2]
    sleep 0.5
    play c[1]
    sleep 0.5
    play c[3]
    sleep 0.5
    
    
    #SCALE
    #changing the ending of the scale everytime it is looped to from low to higher pi
    play (scale :F3, :minor_pentatonic).choose, attack: 2.0, release: 0.9, amp: 0.5, pan: -0.3
    play (scale choose([:C4, :C5]), :minor_pentatonic).choose, attack: 2.0, release: 0.9, amp: 0.4 , pan: -0.4 if one_in(3)
    play (scale choose([:F4, :F5]), :minor_pentatonic).tick, amp: 0.3
    play_pattern_timed (scale choose([:F4, :F5, :C3]), :minor_pentatonic, num_octaves: choose([2,3])), choose([0.0625, 0.125]), amp: 0.5, cutoff: rrand_i(65, 85), cutoff_slide: 7.0, release: 3
    sleep(3)
    
  end
end









