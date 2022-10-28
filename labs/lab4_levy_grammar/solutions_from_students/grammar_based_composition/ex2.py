# %% Import libraries
import os
os.chdir(os.path.dirname(os.path.abspath(__file__)))
from classes import Sonifier, Grammar_Sequence, metronome_grammar

# %%
ex2_grammar={
    "S":["M", "SM"],
    "M": [["H","H"], ["Q", "H", "Q"]],    
    "H": [["h"], ["Q","Q"], ["o", "q", "o"]],
    "Q": [["q"], ["o","o"]]
}

ex2_word_dur={"h":0.5, # half-measure
              "q":0.25, # quarter-measure
              "o": 0.125,
}


if __name__=="__main__":
    fn_out="ex2.wav"

    NUM_M=8
    START_SEQUENCE=["M",]*NUM_M
    G=Grammar_Sequence(ex2_grammar)        
        
    final_sequence, seqs=G.create_sequence(START_SEQUENCE)
    for seq in seqs:
        print(" ".join(seq))
    print(f"Final sequence: {' '.join(final_sequence)}")    
    
    S= Sonifier("sounds/cymb.wav", BPM=174, word_dur=ex2_word_dur)
    audio_array=S.create_audio(final_sequence, add_metronome=True)
    S.write("out/"+fn_out, audio_sequence=audio_array)

# %%
