import { expect, describe, it } from '@jest/globals';
import './jest_extensions';

describe('Part 1 - Query 09', () => {
  it('should return the correct results', async () => {
    await expect('../part1/query09.sql')
      .toReturnRecords(
        ['expected_results/part1/query09.csv'],
        { orderBy: 'passholder_type' },
      );
  });
});