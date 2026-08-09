define :play_bar do |notes, durations, accents|
  notes.each_with_index do |n, i|
    d=durations[i]
    a=accents[i]
    
    if n!=:r && a>0
      play n,release: d*0.8, amp: rrand(a*0.8,a*1.25)*0.9
    end
    sleep d
  end
end

bar1_notes=[:g5 ,:e5 ,:d5 ,:c5 ,:e5 ,:g5 ,:d5 ,:r  ]
bar1_durrs=[0.5 ,0.5 ,0.5 ,0.5 ,0.5 ,0.5 ,0.5 ,0.5 ]
bar1_acces=[0.5 ,0.5 ,0.5 ,0.5 ,0.5 ,0.5 ,0.5 ,0.5 ]

bar2_notes=[:g5 ,:d5 ,:e6 ,:c6 ,:d5 ,:d5 ,:g5 ,:r  ]
bar2_durrs=[0.5 ,0.5 ,0.5 ,0.5 ,0.5 ,0.5 ,0.5 ,0.5 ]
bar2_acces=[0.5 ,0.5 ,0.5 ,0.5 ,0.5 ,0.5 ,0.5 ,0.5 ]

bar3_notes=[:e5 ,:g5 ,:a5 ,:a5 ,:a5 ,:g5 ,:d5 ,:r  ]
bar3_durrs=[0.5 ,0.5 ,0.5 ,0.5 ,0.5 ,0.5 ,0.5 ,0.5 ]
bar3_acces=[0.5 ,0.5 ,0.5 ,0.5 ,0.5 ,0.5 ,0.5 ,0.5 ]

bar4_notes=[:a5 ,:a5 ,:c6 ,:g5 ,:g5 ,:e5 ,:d5 ,:r  ]
bar4_durrs=[0.5 ,0.25,0.75,0.5 ,0.5 ,0.5 ,0.5 ,0.5 ]
bar4_acces=[0.5 ,0.5 ,0.5 ,0.5 ,0.5 ,0.5 ,0.5 ,0.5 ]

bar5_notes=[:d5 ,:e6 ,:c6 ,:d5 ,:d5 ,:g5 ,:g5 ,:r  ]
bar5_durrs=[0.5 ,0.5 ,0.5 ,0.5 ,0.5 ,0.5 ,0.5 ,0.5 ]
bar5_acces=[0.5 ,0.5 ,0.5 ,0.5 ,0.5 ,0.5 ,0.5 ,0.5 ]

bar6_notes=[:c6 ,:d6 ,:e6 ,:c6 ,:a5 ,:c6 ,:g6 ,:r  ]
bar6_durrs=[0.5 ,0.5 ,0.5 ,0.5 ,0.5 ,0.5 ,0.5 ,0.5 ]
bar6_acces=[0.5 ,0.5 ,0.5 ,0.5 ,0.5 ,0.5 ,0.5 ,0.5 ]

bar7_notes=[:e5 ,:g5 ,:a5 ,:a5 ,:a5 ,:g5 ,:d5 ,:r  ]
bar7_durrs=[0.5 ,0.5 ,0.5 ,0.5 ,0.5 ,0.5 ,0.5 ,0.5 ]
bar7_acces=[0.5 ,0.5 ,0.5 ,0.5 ,0.5 ,0.5 ,0.5 ,0.5 ]

bar8_notes=[:a5 ,:c6 ,:a6 ,:g5 ,:g5 ,:e5 ,:d5 ,:r  ]
bar8_durrs=[0.5 ,0.25,0.75,0.5 ,0.5 ,0.5 ,0.5 ,0.5 ]
bar8_acces=[0.5 ,0.5 ,0.5 ,0.5 ,0.5 ,0.5 ,0.5 ,0.5 ]

use_bpm 60

with_fx :level, amp: 1.0 do |master|
  live_loop :master_controller do
    # intro
    control master, amp: 1.0, amp_slide: 8
    sleep 8
    
    # main
    sleep 248
    
    # outro
    control master, amp: 0.0, amp_slide: 8
    sleep 8
    
    stop
  end
  
  with_fx :reverb, room: 0.9, mix: 0.6 do
    
    live_loop :melody do
      use_synth :piano
      with_fx :pan, pan: 0 do
        play_bar bar1_notes, bar1_durrs, bar1_acces
        play_bar bar2_notes, bar2_durrs, bar2_acces
        play_bar bar3_notes, bar3_durrs, bar3_acces
        play_bar bar4_notes, bar4_durrs, bar4_acces
        play_bar bar5_notes, bar5_durrs, bar5_acces
        play_bar bar6_notes, bar6_durrs, bar6_acces
        play_bar bar7_notes, bar7_durrs, bar7_acces
        play_bar bar8_notes, bar8_durrs, bar8_acces
      end
    end
    
    live_loop :pad do
      use_synth :hollow
      
      chords=[chord(:a4,:sus4),chord(:c4,:sus4),chord(:e4,:sus4),chord(:g4,:sus4)]
      
      chords.each do |target_chord|
        play target_chord, attack: 0.5, sustain: 3, release: 0.5
        sleep 4
      end
      
      chords=[chord(:c5,:sus4),chord(:d5,:sus4),chord(:g5,:sus4),chord(:a5,:sus4)]
      
      chords.each do |target_chord|
        play target_chord, attack: 0.5, sustain: 3, release: 0.5
        sleep 4
      end
    end
    
    live_loop :piano_melody do
      use_synth :piano
      
      notes_a=[:a4 ,:c4 ,:e4 ,:a4 ]
      notes_b=[:d4 ,:e4 ,:g4 ,:a4 ]
      notes_c=[:c4 ,:e4 ,:a4 ,:c5 ]
      
      notes_e=[:c5 ,:d5 ,:g4 ,:c5 ]
      notes_f=[:d4 ,:g4 ,:a4 ,:c5 ]
      notes_g=[:e4 ,:a4 ,:d5 ,:e5 ]
      
      notes_a.each { |n| play n, attack: 0.2, sustain: 0.9, release: 0.2, amp: 0.5; sleep 1}
      notes_b.each { |n| play n, attack: 0.2, sustain: 0.9, release: 0.2, amp: 0.5; sleep 1}
      notes_a.each { |n| play n, attack: 0.2, sustain: 0.9, release: 0.2, amp: 0.5; sleep 1}
      notes_c.each { |n| play n, attack: 0.2, sustain: 0.9, release: 0.2, amp: 0.5; sleep 1}
      notes_a.each { |n| play n, attack: 0.2, sustain: 0.9, release: 0.2, amp: 0.5; sleep 1}
      notes_b.each { |n| play n, attack: 0.2, sustain: 0.9, release: 0.2, amp: 0.5; sleep 1}
      notes_a.each { |n| play n, attack: 0.2, sustain: 0.9, release: 0.2, amp: 0.5; sleep 1}
      notes_c.each { |n| play n, attack: 0.2, sustain: 0.9, release: 0.2, amp: 0.5; sleep 1}
      notes_e.each { |n| play n, attack: 0.2, sustain: 0.9, release: 0.2, amp: 0.5; sleep 1}
      notes_f.each { |n| play n, attack: 0.2, sustain: 0.9, release: 0.2, amp: 0.5; sleep 1}
      notes_e.each { |n| play n, attack: 0.2, sustain: 0.9, release: 0.2, amp: 0.5; sleep 1}
      notes_g.each { |n| play n, attack: 0.2, sustain: 0.9, release: 0.2, amp: 0.5; sleep 1}
      notes_e.each { |n| play n, attack: 0.2, sustain: 0.9, release: 0.2, amp: 0.5; sleep 1}
      notes_f.each { |n| play n, attack: 0.2, sustain: 0.9, release: 0.2, amp: 0.5; sleep 1}
      notes_e.each { |n| play n, attack: 0.2, sustain: 0.9, release: 0.2, amp: 0.5; sleep 1}
      notes_g.each { |n| play n, attack: 0.2, sustain: 0.9, release: 0.2, amp: 0.5; sleep 1}
    end
    
    live_loop :texture do
      sample :ambi_lunar_land, amp: 0.3, attack: 2, sustain: 4, release: 2
      sleep 8
    end
    
    live_loop :ride_cymbal do
      sample :perc_bell, amp: 0.2
      sleep 4
      sample :ride_tri, amp: 0.4
      sleep 4
    end
    
    
  end
end