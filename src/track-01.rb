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

bar1_notes=[:a6 ,:r  ,:r  ,:g6 ,:gs6,:r  ,:f6 ,:r  ]
bar1_durrs=[0.5 ,0.5 ,0.5 ,0.5 ,0.5 ,0.5 ,0.5 ,0.5 ]
bar1_acces=[0.5 ,0.5 ,0.5 ,0.5 ,0.5 ,0.5 ,0.5 ,0.5 ]

bar2_notes=[:e6 ,:r  ,:d6 ,:c6 ,:gs6,:r  ,:r  ,:r  ]
bar2_durrs=[0.5 ,0.5 ,0.5 ,0.5 ,0.5 ,0.5 ,0.5 ,0.5 ]
bar2_acces=[0.5 ,0.5 ,0.5 ,0.5 ,0.5 ,0.5 ,0.5 ,0.5 ]

bar3_notes=[:a6 ,:b6 ,:c7 ,:b6 ,:gs6,:r  ,:f6 ,:e6 ]
bar3_durrs=[0.5 ,0.5 ,0.5 ,0.5 ,0.5 ,0.5 ,0.5 ,0.5 ]
bar3_acces=[0.5 ,0.5 ,0.5 ,0.5 ,0.5 ,0.5 ,0.5 ,0.5 ]

bar4_notes=[:a6 ,:a6 ,:r  ,:r  ,:gs6,:r  ,:f6 ,:r  ]
bar4_durrs=[0.5 ,0.5 ,0.5 ,0.5 ,0.5 ,0.5 ,0.5 ,0.5 ]
bar4_acces=[0.5 ,0.5 ,0.5 ,0.5 ,0.5 ,0.5 ,0.5 ,0.5 ]

use_bpm 60

with_fx :level, amp: 0 do |master|
  live_loop :master_controller do
    # intro
    control master, amp: 1.0, amp_slide: 8
    sleep 8
    
    # main
    sleep 232
    
    # outro
    control master, amp: 0.0, amp_slide: 8
    sleep 8
    
    stop
  end
  
  with_fx :reverb, room: 0.9, mix: 0.6 do
    
    live_loop :melody do
      use_synth :dull_bell
      with_fx :pan, pan: 0 do
        play_bar bar1_notes, bar1_durrs, bar1_acces
        play_bar bar2_notes, bar2_durrs, bar2_acces
        play_bar bar3_notes, bar3_durrs, bar3_acces
        play_bar bar2_notes, bar2_durrs, bar2_acces
        play_bar bar4_notes, bar4_durrs, bar4_acces
      end
    end
    
    live_loop :pad do
      use_synth :hollow
      
      chords=[chord(:d4,:maj),chord(:f4,:min),chord(:a4,:min),chord(:g4,:maj)]
      
      chords.each do |target_chord|
        play target_chord, attack: 0.5, sustain: 3, release: 0.5
        sleep 4
      end
    end
    
    live_loop :piano_melody do
      use_synth :piano
      
      notes_a=[:g5 ,:a5 ,:fs5, :b4 ]
      notes_b=[:g5 ,:a5 ,:cs6, :b5 ]
      notes_c=[:g5 ,:es5,:fs5, :f5 ]
      
      notes_a.each { |n| play n, attack: 0.1, sustain: 0.8, release: 0.2; sleep 1}
      notes_b.each { |n| play n, attack: 0.1, sustain: 0.8, release: 0.2; sleep 1}
      notes_a.each { |n| play n, attack: 0.1, sustain: 0.8, release: 0.2; sleep 1}
      notes_c.each { |n| play n, attack: 0.1, sustain: 0.8, release: 0.2; sleep 1}
      notes_b.each { |n| play n, attack: 0.1, sustain: 0.8, release: 0.2; sleep 1}
      notes_c.each { |n| play n, attack: 0.1, sustain: 0.8, release: 0.2; sleep 1}
    end
    
    live_loop :texture do
      sample :ambi_lunar_land, amp: 0.3, attack: 2, sustain: 4, release: 2
      sleep 8
    end
    
    live_loop :sparkles do
      use_synth :pluck
      sync :piano_melody
      
      with_fx :echo, phase: 0.75, decay: 4 do
        play (scale :c5, :minor_pentatonic).choose, amp: 0.2, cutoff: rrand(70,100)
      end
    end
    
  end
end