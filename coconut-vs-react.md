<table width="100%" border="1">

<tr>
	<th></th>
	<th>React</th>
	<th>Coconut / Haxe</th>
</tr>

<tr>
	<td>Setting state</td>
	<td><pre><code>onClick={() => this.setState({ count: this.count + 1 })}</code></pre></td>
	<td><pre><code>onclick=${count++}</code></pre></td>
</tr>

<tr>
	<td>Iteration</td>
	<td><pre><code>render: function() {
	const elements = ['one', 'two', 'three'];
	return (
		&lt;ul>
			{elements.map((value, index) => {
				return &lt;li key={index}>{value}&lt;/li>
			})}
		&lt;/ul>
	)
}</code></pre></td>
	<td><pre><code>function render() '
	&lt;for ${index => value in ... ['one', 'two', 'three']}>
		&lt;li key={index}>{value}&lt;/li>
	&lt;/for>
';</code></pre></td>
</tr>

</table>
