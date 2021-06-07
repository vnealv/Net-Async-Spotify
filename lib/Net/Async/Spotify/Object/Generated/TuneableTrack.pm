package Net::Async::Spotify::Object::Generated::TuneableTrack;

use strict;
use warnings;

use mro;
use parent qw(Net::Async::Spotify::Object::Base);

=head1 NAME
 
Net::Async::Spotify::Object::Generated::TuneableTrack - Package representing Spotify TuneableTrack Object
 
=head1 DESCRIPTION
 
Autogenerated module.
Based on https://developer.spotify.com/documentation/web-api/reference/#objects-index
Check C<crawl-api-doc.pl> for more information.
 
=head1 PARAMETERS

Those are Spotify TuneableTrack Object attributes:

=over 4

=item acousticness

Type: Float
Description: A confidence measure from 0.0 to 1.0 of whether the track is acoustic. 1.0 represents high confidence the track is acoustic.

=item danceability

Type: Float
Description: Danceability describes how suitable a track is for dancing based on a combination of musical elements including tempo, rhythm stability, beat strength, and overall regularity. A value of 0.0 is least danceable and 1.0 is most danceable.

=item duration_ms

Type: Integer
Description: The duration of the track in milliseconds.

=item energy

Type: Float
Description: Energy is a measure from 0.0 to 1.0 and represents a perceptual measure of intensity and activity. Typically, energetic tracks feel fast, loud, and noisy. For example, death metal has high energy, while a Bach prelude scores low on the scale. Perceptual features contributing to this attribute include dynamic range, perceived loudness, timbre, onset rate, and general entropy.

=item instrumentalness

Type: Float
Description: Predicts whether a track contains no vocals. “Ooh” and “aah” sounds are treated as instrumental in this context. Rap or spoken word tracks are clearly “vocal”. The closer the instrumentalness value is to 1.0, the greater likelihood the track contains no vocal content. Values above 0.5 are intended to represent instrumental tracks, but confidence is higher as the value approaches 1.0.

=item key

Type: Integer
Description: The key the track is in. Integers map to pitches using standard <a href="https://en.wikipedia.org/wiki/Pitch_class">Pitch Class notation</a>. E.g. 0 = C, 1 = C♯/D♭, 2 = D, and so on.

=item liveness

Type: Float
Description: Detects the presence of an audience in the recording. Higher liveness values represent an increased probability that the track was performed live. A value above 0.8 provides strong likelihood that the track is live.

=item loudness

Type: Float
Description: The overall loudness of a track in decibels (dB). Loudness values are averaged across the entire track and are useful for comparing relative loudness of tracks. Loudness is the quality of a sound that is the primary psychological correlate of physical strength (amplitude). Values typical range between -60 and 0 db.

=item mode

Type: Integer
Description: Mode indicates the modality (major or minor) of a track, the type of scale from which its melodic content is derived. Major is represented by 1 and minor is 0.

=item popularity

Type: Float
Description: The popularity of the track. The value will be between 0 and 100, with 100 being the most popular. The popularity is calculated by algorithm and is based, in the most part, on the total number of plays the track has had and how recent those plays are. <em>Note: When applying track relinking via the <code class="highlighter-rouge">market</code> parameter, it is expected to find relinked tracks with popularities that do not match <code class="highlighter-rouge">min_*</code>, <code class="highlighter-rouge">max_*</code>and <code class="highlighter-rouge">target_*</code> popularities. These relinked tracks are accurate replacements for unplayable tracks with the expected popularity scores. Original, non-relinked tracks are available via the <code class="highlighter-rouge">linked_from</code> attribute of the <a href="/documentation/general/guides/track-relinking-guide">relinked track response</a>.</em>

=item speechiness

Type: Float
Description: Speechiness detects the presence of spoken words in a track. The more exclusively speech-like the recording (e.g. talk show, audio book, poetry), the closer to 1.0 the attribute value. Values above 0.66 describe tracks that are probably made entirely of spoken words. Values between 0.33 and 0.66 describe tracks that may contain both music and speech, either in sections or layered, including such cases as rap music. Values below 0.33 most likely represent music and other non-speech-like tracks.

=item tempo

Type: Float
Description: The overall estimated tempo of a track in beats per minute (BPM). In musical terminology, tempo is the speed or pace of a given piece and derives directly from the average beat duration.

=item time_signature

Type: Integer
Description: An estimated overall time signature of a track. The time signature (meter) is a notational convention to specify how many beats are in each bar (or measure).

=item valence

Type: Float
Description: A measure from 0.0 to 1.0 describing the musical positiveness conveyed by a track. Tracks with high valence sound more positive (e.g. happy, cheerful, euphoric), while tracks with low valence sound more negative (e.g. sad, depressed, angry).

=back

=cut

sub new {
    my ($class, %args) = @_;

    my $fields = {
        acousticness => 'Float',
        danceability => 'Float',
        duration_ms => 'Integer',
        energy => 'Float',
        instrumentalness => 'Float',
        key => 'Integer',
        liveness => 'Float',
        loudness => 'Float',
        mode => 'Integer',
        popularity => 'Float',
        speechiness => 'Float',
        tempo => 'Float',
        time_signature => 'Integer',
        valence => 'Float',
    };

    my $obj = next::method($class, $fields, %args);

    return $obj;
}

1;
