const String sliverToBoxAdapterRnEquivalent = r'''
In React Native, layout and scroll components do not use a strict separation of "Slivers" and "Boxes".
• A standard scrollable layout in React Native utilizes `<ScrollView>` which can take any custom `<View>` (box) or mapping array as a child:
  ```jsx
  <ScrollView>
    <ProfileHeader /> // standard component
    {items.map(item => <ListItem key={item.id} />)}
  </ScrollView>
  ```
• For performance-optimized lists, `FlatList` provides `ListHeaderComponent` and `ListFooterComponent` properties which accept normal components directly:
  ```jsx
  <FlatList
    data={items}
    ListHeaderComponent={<ProfileHeader />} // No adapter needed
    renderItem={({ item }) => <ListItem />}
  />
  ```
In Flutter, a `CustomScrollView` has a strict contract requiring all direct children to be Slivers (e.g. `SliverList`, `SliverGrid`). `SliverToBoxAdapter` acts as the bridge that wraps a standard `RenderBox` widget so it complies with the sliver protocol.

### Best Practices & Performance
• Avoid Overuse: Wrap only individual or short components. Do not put a long Column of many widgets inside a single SliverToBoxAdapter, as this disables lazy rendering/scrolling optimizations and can cause UI lag.
• Infinite Heights: The child of a SliverToBoxAdapter must have bounded height or be able to determine its height based on its constraints. Never put an unbounded scrollable or infinite-height widget directly inside without giving it a fixed height.
''';
