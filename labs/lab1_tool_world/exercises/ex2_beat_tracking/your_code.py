# any import? 
import librosa
import numpy as np

def compute_beats(y, sr):
    """This function uses librosa library to compute beats from an audio signal
    and returns the time index where the beats occur 

    Parameters
    ----------
    y : np.ndarray
        time-domain audio signal
    sr : int, float
        samplerate

    Returns
    -------
    np.ndarray
        sample index where beat occurs
    """
    # your code here
    # suggestons: look for librosa's frames_to_samples
    tempo, beats = librosa.beat.beat_track(y = y, sr = sr)
    beat_samples = librosa.frames_to_samples(beats)

    return beat_samples

def add_samples(y, sample, beats):
    """Add a sample to an audio signal at given beats 

    Parameters
    ----------
    y : np.ndarray
        the original signal
    sample : np.ndarray
        the sample beat to add
    beats : np.ndarray
        the time beats

    Returns
    -------
    np.ndarray
        original signal + sample on beats
    """
    y_out=y.copy()
    # your code here ...
    s = np.zeros(y.size)
    sample_len = sample.size
    for i in beats:
        s[i:i+sample_len] += sample

    return y_out + s

