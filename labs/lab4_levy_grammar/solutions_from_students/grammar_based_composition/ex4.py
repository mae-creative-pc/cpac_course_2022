# %% Import libraries
import os
os.chdir(os.path.dirname(os.path.abspath(__file__)))
from classes import Sonifier, Grammar_Sequence, metronome_grammar

# %%
ex_4_grammar={
    "S":["M", "SM"],
    "M": [["H","H"], ["Q", "H", "Q"], ["w"], ["pw"]],    
    "H": [["h"], ["Q","Q"], ["ph"]],
    "Q": [["q"], ["pq"]]
}
ex_4_word_dur={
    "w": 1, "h":0.5, "q":0.25,
     "pw": 1, "ph":0.5, "pq":0.25,
}

if __name__=="__main__":
    fn_out="ex_4.wav"

    NUM_M=8
    START_SEQUENCE=["M",]*NUM_M
    G=Grammar_Sequence(ex_4_grammar)        
        
    final_sequence, seqs=G.create_sequence(START_SEQUENCE)
    for seq in seqs:
        print(" ".join(seq))
    print(f"Final sequence: {' '.join(final_sequence)}")    
    
    S= Sonifier("sounds/kick.wav", BPM=174, word_dur=ex_4_word_dur)
    audio_array=S.create_audio(final_sequence, add_metronome=True)
    S.write("out/"+fn_out, audio_sequence=audio_array)

# %%
