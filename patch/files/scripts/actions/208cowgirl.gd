extends Node

const category = 'fucking'
const code = 'cowgirl'
const order = 4.1
var givers
var takers
const canlast = true
const giverpart = 'vagina'
const takerpart = 'penis'
const virginloss = true
const giverconsent = 'basic'
const takerconsent = 'any'
const givertags = ['vagina', 'penetration']
const takertags = ['penis']

func requirements():
	var valid = true
	if takers.size() < 1 || givers.size() < 1:
		valid = false
	if takers.size() > 2 || givers.size() > 2:
		valid = false
	for i in givers:
		if i.person.vagina == 'none':
			valid = false
	for i in takers:
		if i.person.penis == 'none' && i.strapon == null:
			valid = false
	return valid

func getname(state = null):
	return "Cowgirl"

func getongoingname(givers, takers):
	return "[name1] fuck[s/1] [name2] in the cowgirl position."

func givereffect(member):
	var result
	var effects = {sens = 220}
	member.person.metrics.vag += 1
	if member.consent == true || (member.person.traits.find("Likes it rough") >= 0 && member.sens >= 200):
		result = 'good'
	elif member.person.traits.find("Likes it rough") >= 0:
		result = 'average'
	else:
		result = 'bad'
	if member.lube < 3:
		effects.pain = 3
	return [result, effects]

func takereffect(member):
	var result
	var effects = {sens = 200}
	if (member.consent == true || member.person.traits.find("Likes it rough") >= 0) && member.sens >= 200 && member.lube >= 3:
		result = 'good'
	elif (member.consent == true || member.person.traits.find("Likes it rough") >= 0):
		result = 'average'
	else:
		result = 'bad'
	if member.person.penis == 'none':
		effects.sens /= 1.2
	return [result, effects]

#orientation of givers/takers
const rotation1 = Quat(0.5,0.0,0.0,0.0)
const rotation2 = Quat(0.5,0.0,0.0,0.0)

const initiate = ['start_1_cowgirl','start_7_fsexv']

const ongoing = ['main_7_fsexv','main_8_fsexv','main_9_fsexv']

const reaction = ['react_7_fsex','react_8_fsex','react_9_fsexv']

const linkset = "sex"

const act_lines = {

start_1_cowgirl = {

	repeat_nice = {
	conditions = {
		link = ["cowgirl"],
		consent = [true],
	},
	lines = [
		"[name1] {^straddle:ride}[s/1] [name2]",
		"[name1] {^hug:hold:squeeze}[s/1] [name2] close to [his1] bod[y/ies1]",
		"[name1] {^bounce:grind}[s/1] on [names2] [penis2]",
	]},

	repeat_mean = {
	conditions = {
		link = ["cowgirl"],
		consent = [false],
	},
	lines = [
		"[name1] {^roughly:harshly:mercilessly}{^pound[s/1]:bounce[s/1]} on [names2] [penis2]",
		"[name1] {^pin[s/1]:hold[s/1]} [name2] down and {^start:begin} to ride [him2]",
	]},

	insert_nice = {
	conditions = {
		link = [null],
		consent = [true],
	},
	lines = [
		"[name1] {^gently :}{^lay:set}[s/1] [name2] down{^ on [his2] back:}",
		"[name1] {^roll:shift}[s/1] [name2] onto [his2] back and {^move:climb}[s/1] {^atop:on top of} [him2]",
	]},

	insert_mean = {
	conditions = {
		link = [null],
		consent = [false],
	},
	lines = [
		"[name1] {^roughly :}{^push[es/1]:pin[s/1]:hold[s/1]} [name2] down{^ on [his2] back:}",
		"[name1] {^toss[es/1]:throw[s/1]:wrestle[s/1]} [name2] onto [his2] back and {^move:climb}[s/1] {^atop:on top of} [him2]",
	]},

},


start_7_fsexv = {

	shift = {
	conditions = {
		orifice = ["shift"],
	},
	lines = [
		", {^enjoying:relishing in} the closeness of [partners2] [body2]. ",
	]},

	insert = {
	conditions = {
		orifice = ["insert"],
	},
	lines = [
		", {^shift:move:raise}[s/1] [his2] {^hips:[body2]} to give [himself1] better access for [his1] [pussy1]. ",
	]},

},

main_7_fsexv = {

	nice = {
	conditions = {
		consent = [true],
	},
	lines = [
		"[name2] arch[es/2] [his2] back as ",
		"[name2] {^shift:move:raise}[s/2] [his2] body {^to allow [name1] to go deeper:to get deeper in [name1]} as ",
	]},

	mean = {
	conditions = {
		consent = [false],
	},
	lines = [
		"[name2] {^helplessly :fruitlessly :weakly :}struggle[s/2] against [name1] as ",
	]},

	insert = {
	conditions = {
		orifice = ["insert"]
	},
	lines = [
		"[names1] [labia1] {^envelop:spread apart for:swallow} [names2] [penis2] as ",
	]},

	noninsert = {
	conditions = {
		orifice = ["same","shift","swap"]
	},
	lines = [
		"[names1] [labia1] {^slide along:coil around:tug at} [names2] [penis2] as ",
	]},

},

main_8_fsexv = {

	any = {
	conditions = {
	},
	lines = [
		"[name1] {^fuck:screw:slam:grind}[s/1] [name2] from on top",
		"[name1] {^fuck:screw:slam:grind}[s/1] {^[name2]:[names2] [penis2]}",
		"[name1] {^plunge:thrust:screw:slam:grind}[s/1] {^[himself1]:[his1] [pussy1]} on [name2]",
		"[name1] {^plunge:thrust:screw:slam:grind:fuck:envelop}[s/1] [himself1] on [names2] [penis2]",
	]},

},

main_9_fsexv = {

	locational = {
	conditions = {
	},
	lines = [
		". ",
	]},

},

react_3_sexv = {

	default = {
	conditions = {
	},
	lines = [
		" as [name1] [fucks1] [partner2].",
	]},

},

react_7_fsex = {

	arousal_4 = {
	conditions = {
		consent = [true],
		arousal = [4,5],
	},
	lines = [
		"[name2] dangle[s/2] [his2] tongue[/s2] out of [his2] mouth",
		"[name2] lose[s/2] focus and roll[s/2] [his2] eyes back",
		"[name2] {^cr[ies/y2] out:moans} {^wildly:passionately:lustily} with each movement",
		"[name2] can hardly contain [himself2]",
	]},

	arousal_3 = {
	conditions = {
		consent = [true],
		arousal = [3],
	},
	lines = [
		"[name2] can't help but move [his2] hips",
		"[name2] moan[s/2] loudly",
		"[name2] cr[ies/y2] out with each movement",
	]},

	arousal_2 = {
	conditions = {
		consent = [true],
		arousal = [2],
	},
	lines = [
		"[names2] [body2] {^quiver[s/2]:twitch[es/2]}",
		"[name2] moan[s/2]",
		"[name2] cr[ies/y2] out",
	]},

	arousal_1 = {
	conditions = {
		consent = [true],
		arousal = [1],
	},
	lines = [
		"[name2] let[s/2] out {^quiet:muffled} noises",
		"[name2] twitch[es/2]",
		"[name2] softly moan[s/2]",
	]},

},

react_8_fsex = {

	arousal_4 = {
	conditions = {
		consent = [true],
		arousal = [4,5],
	},
	lines = [
		", {^rapidly:quickly} {^nearing:approaching:edging toward} {^orgasm:[his2] climax:[his2] peak}",
		", {^resting:teetering} on the {^verge:edge} of {^orgasm:climax}",
		"",
	]},

	arousal_3 = {
	conditions = {
		consent = [true],
		arousal = [3],
	},
	lines = [
		", [his2] {^enjoyment:pleasure:satisfaction} {^clearly :}{^showing:evident}",
		", the {^pleasure:sensations} inside [him2] becoming too much to {^bear:take}",
		"",
	]},

	arousal_2 = {
	conditions = {
		consent = [true],
		arousal = [2],
	},
	lines = [
		", [his2] {^enjoyment:pleasure:satisfaction} building",
		", pleasure {^building:welling up} inside [him2]",
		"",
	]},

	arousal_1 = {
	conditions = {
		consent = [true],
		arousal = [1],
	},
	lines = [
		", {^still adjusting:getting adjusted:far from orgasm}",
		", only just beginning to enjoy [himself2]",
		"",
	]},

},

react_9_fsexv = {

	consent = {
	conditions = {
		consent = [true],
	},
	lines = [
		" as [names2] [penis2] {^fill[s/#2]:slide[s/#2] in and out of} [his1] [pussy1].",
		" as [names2] [penis2] {^massage[s/#2]:scrape[s/#2] against:rub[s/#2] against} the walls of [his1] [pussy1].",
	]},

	default = {
	conditions = {
		consent = [false],
	},
	lines = [
		"",
	]},

},

} 
