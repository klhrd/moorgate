define :play_bar do |notes, durations, accents|
  notes.each_with_index do |n, i|
    d=durations[i]
    a=accents[i]
    
    if n!=:r && a>0
      play n,release: d*0.8, amp: a*1.5
    end
    sleep d
  end
end

bar1_notes=[:g5 ,:e5 ,:eb5,:d5 ,:c5 ,:e5 ,:g5 ,:a5 ]
bar1_durrs=[0.6 ,0.25,0.75,0.4 ,0.25,0.5 ,0.25,1.0 ]
bar1_acces=[0.5 ,0.5 ,0.8 ,0.5 ,0.5 ,0.5 ,0.5 ,0.5 ]

bar2_notes=[:g5 ,:d5 ,:e6 ,:c6 ,:d5 ,:eb5,:g5 ,:a5 ]
bar2_durrs=[0.6 ,0.4 ,0.6 ,0.4 ,0.33,0.33,0.34,1.0 ]
bar2_acces=[0.5 ,0.5 ,0.5 ,0.5 ,0.8 ,0.5 ,0.5 ,0.5 ]

bar3_notes=[:e5 ,:g5 ,:a5 ,:a5 ,:g5 ,:eb5,:d5 ,:e5 ]
bar3_durrs=[0.6 ,0.25,0.75,0.4 ,0.33,0.33,0.34,1.0 ]
bar3_acces=[0.5 ,0.5 ,0.8 ,0.5 ,0.8 ,0.5 ,0.5 ,0.5 ]

bar4_notes=[:a5 ,:a5 ,:c6 ,:g5 ,:g5 ,:e5 ,:d5 ,:a5 ]
bar4_durrs=[0.6 ,0.4 ,0.6 ,0.4 ,0.33,0.33,0.34,1.0 ]
bar4_acces=[0.5 ,0.5 ,0.5 ,0.5 ,0.5 ,0.8 ,0.5 ,0.5 ]

bar5_notes=[:d5 ,:eb5,:e6 ,:d5 ,:d5 ,:g5 ,:g5 ,:e5 ]
bar5_durrs=[0.6 ,0.25,0.75,0.4 ,0.25,0.5 ,0.25,1.0 ]
bar5_acces=[0.5 ,0.5 ,0.8 ,0.5 ,0.5 ,0.5 ,0.5 ,0.5 ]

bar6_notes=[:d5 ,:g5 ,:e6 ,:c6 ,:eb5,:c6 ,:g6 ,:a5 ]
bar6_durrs=[0.6 ,0.4 ,0.6 ,0.4 ,0.33,0.33,0.34,1.0 ]
bar6_acces=[0.5 ,0.5 ,0.5 ,0.5 ,0.8 ,0.5 ,0.5 ,0.5 ]

bar7_notes=[:e5 ,:g5 ,:a5 ,:a5 ,:a5 ,:g5 ,:d5 ,:a5 ]
bar7_durrs=[0.6 ,0.25,0.75,0.4 ,0.33,0.33,0.34,1.0 ]
bar7_acces=[0.5 ,0.5 ,0.8 ,0.5 ,0.8 ,0.5 ,0.5 ,0.5 ]

bar8_notes=[:a5 ,:c6 ,:a6 ,:g5 ,:g5 ,:e5 ,:d5 ,:e5 ]
bar8_durrs=[0.6 ,0.4 ,0.6 ,0.4 ,0.33,0.33,0.3 ,1.0 ]
bar8_acces=[0.5 ,0.5 ,0.5 ,0.5 ,0.5 ,0.8 ,0.5 ,0.5 ]

use_bpm 105

with_fx :level, amp: 0.0 do |master|
  
  live_loop :master_controller do
    # intro
    control master, amp: 1.0, amp_slide: 6
    sleep 6
    
    # main
    sleep 378
    
    # outro
    control master, amp: 0.0, amp_slide: 6
    sleep 6
    
    stop
  end
  
  with_fx :reverb, room: 0.9, mix: 0.6 do
    
    live_loop :melody do
      use_synth :bass_foundation
      with_fx :distortion, distort: 0.2 do
        play_bar bar1_notes, bar1_durrs, bar1_acces
        play_bar bar2_notes, bar2_durrs, bar2_acces
        play_bar bar3_notes, bar3_durrs, bar3_acces
        play_bar bar4_notes, bar4_durrs, bar4_acces
        play_bar bar5_notes, bar5_durrs, bar5_acces
        play_bar bar6_notes, bar6_durrs, bar6_acces
        play_bar bar7_notes, bar7_durrs, bar7_acces
        play_bar bar8_notes, bar8_durrs, bar8_acces
        play_bar bar1_notes, bar1_durrs, bar1_acces
        play_bar bar2_notes, bar2_durrs, bar2_acces
        play_bar bar3_notes, bar3_durrs, bar3_acces
        play_bar bar4_notes, bar4_durrs, bar4_acces
        play_bar bar1_notes, bar3_durrs, bar1_acces
        play_bar bar2_notes, bar4_durrs, bar2_acces
      end
    end
    
    live_loop :pad do
      use_synth :pluck
      
      chords=[chord(:a4,:dom7),chord(:a4,:dom7),chord(:d4,:dom7),chord(:a4,:dom7),chord(:d4,:dom7),chord(:e4,:dom7)]
      
      chords.each do |target_chord|
        play target_chord, sustain: 2, amp: 2
        sleep 2
      end
    end
    
    live_loop :melody_2 do
      use_synth :bass_foundation
      
      banks=[[:a1,:e2],[:a1,:e2],[:d2,:a2],[:a1,:e2],[:d2,:a2],[:e2,:a2]]
      
      banks.each do |e|
        play e[0], amp: 1; sleep 0.66
        play e[1], amp: 1; sleep 0.34
        play e[0], amp: 1; sleep 0.66
        play e[1], amp: 1; sleep 0.34
        
      end
    end
    
    with_fx :compressor do
      
      live_loop :drums do
        sample :bd_tek, amp: 0.7
        sleep 1
        sample :sn_dolf, amp: 0.4
        sleep 1
      end
    end
    
    
  end
end

