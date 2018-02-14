use_bpm 140

live_loop :bassbot do
  ##| with_fx :lpf, cutoff: 60, cutoff_slide: 64 do |e|
  ##|   control e, cutoff: 130
  ##|   8.times do
  with_fx :gverb, room: 34, mix: 0.2 do
    with_fx :bitcrusher, sample_rate: 4000, mix: 0 do
      with_fx :wobble, phase: 7, cutoff_min: 30, cutoff_max: 90, mix: 0 do
        with_fx :slicer, phase: 0.75, wave: 0, mix: 1 do
          with_fx :level, amp: 3 do
            t = 8
            tick
            ##| bs = synth :dsaw, note: ring(21,24,24,26).look, sustain: t, release: 0, detune: 0.3, cutoff: 60
            ##| bs1 = synth :dsaw, note: ring(21,24,24,26).look+12, sustain: t, release: 0, detune: 0.3, cutoff: 85
            ##| a = 1
            ##| killa = knit(false, 4-a, true, a, false, 4).look
            ##| synth :dtri, note: ring(24,28,26,21).look+12, sustain: t, release: 0, detune: 0.3, cutoff: 60
            sleep 4
            ##| on killa do
            ##|   kill bs
            ##|   kill bs1
            ##| end
            sleep 4
            ##| stop
          end
        end
      end
    end
    ##| stop
  end
  ##|   end
  ##| end
end

in_thread do
  live_loop :beatbot do
    2.times do
      2.times do
      ##| sample :bd_haus, amp: 10, cutoff: 90
      sleep 1
      end
      ##| with_fx :echo, phase: ring(0.5,0.25,0.75,1).tick, decay: 2, mix: 1 do
      ##|   sample :bd_haus, amp: 10, cutoff: 90
      ##| end
      ##| with_fx :gverb, room: 34, tail_level: 0.9, release: 4, mix: 0.4, damp: 0 do
      ##|   sample :sn_zome, release: 0.75, amp: ring(0,0,5,0).look, finish: 0.5
      ##| end
      ##| a = 0
      ##| sleep ring(2+a,2-a).look*1
    end
  end
end

in_thread do
  live_loop :synthbot1 do
    with_fx :slicer, phase: 0.25*1, wave: 0, mix: 1 do
      with_fx :level, amp: 3 do
        d = synth :supersaw, note: chord(ring(24,28,26,21).tick+36, ring(:major7,'m7',:major7,'m11').look, invert: ring(0,3).look), sustain: 8, release: 0, detune: 0.3, cutoff: 110, amp: 1.7
        sleep 8
      end
    end
  end
end

in_thread do
  live_loop :synthbot2 do
    with_fx :gverb, room: 35, mix: 0.5 do
      with_fx :slicer, phase: 0.25*4, wave: 0, mix: 1 do
        ##| s = synth :dsaw, note: 72+0, note_slide: 4, attack: 0, sustain: 32, amp: 1, detune: 0.2, cutoff: 120
        sleep 15
        ##| control s, note: 74+0
        sleep 8
        ##| control s, note: 72+0
        sleep 5
        ##| kill s if knit(false, 1, true, 1).tick
        sleep 4
      end
    end
  end
end

in_thread do
  live_loop :hhat do
    tick(:i)
    16.times do
      with_fx :gverb, room: 150, release: 2, mix: 1 do
        sample :elec_blip2, release: rrand(0.10,0.20), amp: ring(0,12).choose, env_curve: 3, rate: 2, cutoff: rrand(80,90) if spread(ring(6).look(:i),16, rotate: 0).tick(:ii)
      end
      ##| synth :cnoise, sustain: 0.05, release: rrand(0,0.2), amp: rrand(0.5,1.2), res: 0.8
      sleep 0.25*1
    end
  end
end

